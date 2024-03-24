<?php

namespace App\Controller;

use App\Entity\Category;
use App\Entity\Order;
use App\Entity\Pizza;
use App\Entity\Pizzas;
use App\Form\CategoryType;
use App\Form\OrderType;
use App\Form\SizeType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
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

    #[Route('/pizzas/{id}', name: 'pizzas')]
    public function pizzas(EntityManagerInterface $em, int $id)
    {
        $category = $em->getRepository(Category::class)->find($id);
        return $this->render('guest/categories/pizzas.html.twig', [
            'category' => $category
        ]);
    }

    #[Route('pizzas/details/{id}', name: 'details')]
    public function details(EntityManagerInterface $em, int $id = null)
    {
        $pizza = $em->getRepository(Pizza::class)->find($id);
        return $this->render('guest/categories/details.html.twig', [
            'pizza' => $pizza
        ]);
    }

    #[Route('/contact', name: 'contact')]
    public function contact()
    {
        return $this->render('guest/contact.html.twig');
    }

    #[Route('/login', name: 'login')]
    public function login()
    {
        return $this->render('guest/login.html.twig');
    }

    #[Route('/signup', name: 'signup')]
    public function signup()
    {
        return $this->render('guest/signup.html.twig');
    }

    #[Route('/order/{id}', name: 'order')]
    public function order(Request $request, EntityManagerInterface $em, int $id)
    {
        $form = $this->createForm(OrderType::class);
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            $pizza = $em->getRepository(Pizza::class)->find($id);
            $order = $form->getData();
            $order->setPizza($pizza);
            $em->persist($order);
            $em->flush();
            return $this->redirectToRoute('orders', ['id' => $pizza->getId()]);
        }

        return $this->render('guest/order.html.twig', [
            'form' => $form
        ]);
    }

    #[Route('order/orders/{id}', name: 'orders')]
    public function showOrder(EntityManagerInterface $em)
    {
        $orders = $em->getRepository(Order::class)->findAll();
        return $this->render('guest/orders.html.twig', [
            'orders' => $orders
        ]);
    }

    #[Route('delete/order/{id}', name: 'delete_order')]
    public function deleteOrder(EntityManagerInterface $em, int $id)
    {
        $orders = $em->getRepository(Order::class)->findAll();
        $order = $em->getRepository(Order::class)->find($id);
        $em->remove($order);
        $em->flush();
        $this->addFlash('success', 'Deze bestelling is verwijderd!');

        return $this->render('guest/orders.html.twig', [
            'orders' => $orders,
            'order' => $order
        ]);
    }
}