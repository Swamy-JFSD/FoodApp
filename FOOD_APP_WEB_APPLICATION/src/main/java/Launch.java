

import java.util.Scanner;

import com.food.app.dao.OrderItemDAO;
import com.food.app.daoimpl.OrderItemDAOImpl;
import com.food.app.model.OrderItem;

public class Launch {

	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);

		addOrder(scan);
	}

	public static void orderSELECTBYID(Scanner scan) {
		System.out.println("Enter the id: ");
		int orderid = scan.nextInt();
		scan.nextLine();
		OrderItemDAO oidao = new OrderItemDAOImpl();

		OrderItem order = oidao.getOrderItemById(orderid);

		System.out.println(order);

		System.out.println("Enter new totalamount: ");
		int totalamount = scan.nextInt();

		order.setTotalamount(totalamount);

		oidao.updateOrderItem(order);
	}
	public static void orderItemDELETEBYID(Scanner scan) {
		System.out.println("Enter the id: ");
		int orderid = scan.nextInt();

		OrderItemDAO oidao = new OrderItemDAOImpl();

		oidao.deleteOrderItem(orderid);

	}

	public static void addOrder(Scanner scan) {

		System.out.println("Enter the orderid:");
		int orderid = scan.nextInt();

		System.out.println("Enter the menuid:");
		int menuid = scan.nextInt();

		System.out.println("Enter the quanity:");
		int quanity = scan.nextInt();

		System.out.println("Enter the totalamount:");
		int totalamount = scan.nextInt();
		
		OrderItem orderitem = new OrderItem(orderid, menuid, quanity, totalamount);
		
		OrderItemDAO oidao = new OrderItemDAOImpl();
		
		oidao.addOrderItem(orderitem);
	}
}