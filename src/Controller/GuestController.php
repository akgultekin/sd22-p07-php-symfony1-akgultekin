<?php

namespace App\Controller;

use App\Entity\Category;
use App\Entity\Pizzas;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class GuestController extends AbstractController
{
    #[Route('/', name: 'home')]
    public function home(EntityManagerInterface $em): Response
    {
        $categories = $em->getRepository(Category::class)->findAll();
        return $this->render('guest/home.html.twig', [
            'categories' => $categories
        ]);
    }

    #[Route('/fish', name: 'fish')]
    public function fish()
    {
        return $this->render("guest/categories/fish.html.twig");
    }

    #[Route('/fish/1', name: 'fish-details')]
    public function fishDetails(int $id = null)
    {
        return $this->render("guest/categories/details.html.twig");
    }

    #[Route('/meat', name: 'meat')]
    public function meat()
    {
        return $this->render("guest/categories/meat.html.twig");
    }

    #[Route('/meat/1', name: 'meat-details')]
    public function meatDetails(int $id = null)
    {
        return $this->render("guest/categories/details.html.twig");
    }

    #[Route('/vegetarian', name: 'vegetarian')]
    public function vegetarian()
    {
        return $this->render("guest/categories/vegetarian.html.twig");
    }

    #[Route('/vegetarian/1', name: 'vegetarian-details')]
    public function vegetarianDetails(int $id = null)
    {
        return $this->render("guest/categories/details.html.twig");
    }

    #[Route('/contact', name: 'contact')]
    public function contact()
    {
        return $this->render("guest/contact.html.twig");
    }

    #[Route('/login', name: 'login')]
    public function login()
    {
        return $this->render("guest/login.html.twig");
    }

    #[Route('/signup', name: 'signup')]
    public function signup()
    {
        return $this->render("guest/signup.html.twig");
    }

    #[Route('/order', name: 'order')]
    public function order()
    {
        return $this->render("guest/order.html.twig");
    }
}