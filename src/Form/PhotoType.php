<?php

namespace App\Form;

use App\Entity\Benevole;
use App\Entity\Oeuvre;
use App\Entity\Photo;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\Extension\Core\Type\FileType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\DateType;

class PhotoType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('datePriseVue', DateType::class, [
                'widget' => 'single_text',
            ])
            ->add('nomFichier', FileType::class, [
                'mapped' => false,
                'required' => false,
            ])
            ->add('etatOeuvre')
            ->add('oeuvre', EntityType::class, [
                'class' => Oeuvre::class,
                'choice_label' => 'titre',
            ])
            ->add('benevole', EntityType::class, [
                'class' => Benevole::class,
                'choice_label' => 'nom',
            ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Photo::class,
        ]);
    }
}
