<?php

namespace App\Controller;

use App\Entity\Photo;
use App\Form\PhotoType;
use App\Repository\PhotoRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Component\Security\Http\Attribute\IsGranted;
use Symfony\Component\Form\FormInterface;
use Symfony\Component\Filesystem\Filesystem;

#[Route('/photo')]
final class PhotoController extends AbstractController
{
    #[Route(name: 'app_photo_index', methods: ['GET'])]
    public function index(PhotoRepository $photoRepository): Response
    {
        return $this->render('photo/index.html.twig', [
            'photos' => $photoRepository->findAll(),
        ]);
    }

    #[Route('/new', name: 'app_photo_new', methods: ['GET', 'POST'])]
    #[IsGranted('ROLE_USER')]
    public function new(Request $request, EntityManagerInterface $em): Response
    {
        $photo = new Photo();
        $form = $this->createForm(PhotoType::class, $photo);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $this->gererLaPhoto($form, $photo); // gère la photo avec une méthode (gererLaPhoto) 
            $em->persist($photo);
            $em->flush();

            return $this->redirectToRoute('app_photo_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->render('photo/new.html.twig', [
            'photo' => $photo,
            'form' => $form,
        ]);
    }

    public function gererLaPhoto(FormInterface $form, Photo $photo)
    {
        $nomFichier = $form->get('nomFichier')->getData();
        if ($nomFichier) {
            // on supprime l'ancienne photo AVANT de déplacer la nouvelle
            $this->supprimerFichier($photo->getNomFichier());

            $nomOriginal = pathinfo($nomFichier->getClientOriginalName(), PATHINFO_BASENAME);
            $nomFichier->move('Photos', $nomOriginal);
            $photo->setNomFichier("Photos/" . $nomOriginal);
        }
    }

    #[Route('/{id}', name: 'app_photo_show', methods: ['GET'])]
    public function show(Photo $photo): Response
    {
        return $this->render('photo/show.html.twig', [
            'photo' => $photo,
        ]);
    }

    #[Route('/{id}/edit', name: 'app_photo_edit', methods: ['GET', 'POST'])]
    #[IsGranted('ROLE_USER')]
    public function edit(Request $request, Photo $photo, EntityManagerInterface $em): Response
    {
        $form = $this->createForm(PhotoType::class, $photo);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $this->gererLaPhoto($form, $photo);
            $emG->flush();

            return $this->redirectToRoute('app_photo_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->render('photo/edit.html.twig', [
            'photo' => $photo,
            'form' => $form,
        ]);
    }

    #[Route('/{id}', name: 'app_photo_delete', methods: ['POST'])]
    #[IsGranted('ROLE_USER')]
    public function delete(Request $request, Photo $photo, EntityManagerInterface $em): Response
    {
        if ($this->isCsrfTokenValid('delete'.$photo->getId(), $request->getPayload()->getString('_token'))) {
            $nomFichier = $photo->getNomFichier();
            $em->remove($photo);
            $em->flush();
            $this->supprimerFichier($nomFichier);
        }

        return $this->redirectToRoute('app_photo_index', [], Response::HTTP_SEE_OTHER);
    }

    private function supprimerFichier(?string $nomFichier): void
    {   
        if (!$nomFichier) {
            return;
        }

        $fs = new Filesystem();
        $racine = $this->getParameter('kernel.project_dir');

        foreach ([$racine . '/public/' . $nomFichier, $racine . '/' . $nomFichier] as $chemin) {
            if ($fs->exists($chemin)) {
                $fs->remove($chemin);
            }
        }
    }
}
