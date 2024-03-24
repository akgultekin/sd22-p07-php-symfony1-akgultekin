<?php

namespace App\Form;

use App\Entity\Order;
use App\Entity\Pizza;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\EmailType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class OrderType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('fname', TextType::class, ['label' => 'Voornaam'])
            ->add('lname', TextType::class, ['label' => 'Achternaam'])
            ->add('email', EmailType::class, ['label' => 'Email'])
            ->add('city', TextType::class, ['label' => 'Stad'])
            ->add('street', TextType::class, ['label' => 'Straat'])
            ->add('zip', TextType::class, ['label' => 'Zipcode'])
            ->add('submit', SubmitType::class, ['label' => 'Bestellen'])
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Order::class,
        ]);
    }
}
