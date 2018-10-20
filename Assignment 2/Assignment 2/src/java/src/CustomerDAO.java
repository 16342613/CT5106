/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Irish
 */

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class CustomerDAO {
    
    private static final String DATABASE_URL = "jdbc:mysql://mysql1.it.nuigalway.ie:3306/mydb4362";
    private static final String USERNAME = "mydb4362si";
    private static final String PASSWORD = "ne6tur";
    
    public ArrayList<Customer> getAllCustomers() {
        ArrayList<Customer> customerList = new ArrayList<>();  // Create a null object to hold the customers if the try block succeeds
        Connection connection = null;
        Statement statement = null;
        
        try {
            connection = DriverManager.getConnection(DATABASE_URL, USERNAME, PASSWORD);
            statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT * FROM customers ORDER BY customerNumber");      
  
            while(resultSet.next()) {
                Customer customer = new Customer();
                customer.setCustomerNumber(resultSet.getInt(1));
                customer.setCustomerName(resultSet.getString(2));
                customer.setCustomerCity(resultSet.getString(8));
                customer.setCustomerCreditLimit(resultSet.getDouble(13));
                customer.setCustomerContactName(resultSet.getString(4)+" "+resultSet.getString(3));
                customer.setCustomerPhone(resultSet.getString(5));
                customer.setCustomerAddressLine1(resultSet.getString(6));
                customer.setCustomerAddressLine2(resultSet.getString(7));
                customer.setCustomerPostCode(resultSet.getString(10));
                customer.setCustomerState(resultSet.getString(9));
                customer.setCustomerCountry(resultSet.getString(11));
                customerList.add(customer);
            }
        
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            
            try {
                if(statement != null) statement.close();
                if(connection != null) connection.close();
                } catch (SQLException e) {
                e.printStackTrace();
            }
       }

       return customerList;
    }
    
}
