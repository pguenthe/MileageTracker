package com.guenther.mileage;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;
import org.jasypt.util.password.StrongPasswordEncryptor;

public class DAO {
	private static SessionFactory factory;
	
	private static void setupFactory() {
	    
		 Configuration configuration = new Configuration();

		 // Pass hibernate configuration file
		 configuration.configure("hibernate.cfg.xml");	 
		 factory = configuration.buildSessionFactory();
	}
	
	public static MileageRecord getMileage(int r) {
		if (factory == null)
			setupFactory();
		 // Get current session
		 Session hibernateSession = factory.openSession();

		 // Begin transaction
		 hibernateSession.getTransaction().begin();
		 
		 String sql = "FROM " 
				 + MileageRecord.class.getName() 
				 + " WHERE id=" + r;
		 MileageRecord rec = hibernateSession.
     		  	createQuery(sql, MileageRecord.class).getSingleResult();
		 
		 // Commit transaction
		 hibernateSession.getTransaction().commit();
		 
		 hibernateSession.close();  
				    
		 return rec;  
	}
	
	public static int addMileage(MileageRecord m) {
		
		if (factory == null)
			setupFactory();
		 // Get current session
		 Session hibernateSession = factory.openSession();

		 // Begin transaction
		 hibernateSession.getTransaction().begin();

		 //save this specific record
		 int i = (Integer)hibernateSession.save(m);  
		
		 // Commit transaction
		 hibernateSession.getTransaction().commit();
		
		 hibernateSession.close();  
				    
		 return i;  
	}

	public static void updateMileage(MileageRecord m) {
//		System.out.println("DEBUG: Updating record " + m.getId());
		if (factory == null)
			setupFactory();
		 // Get current session
		 Session hibernateSession = factory.openSession();

		 // Begin transaction
		 hibernateSession.getTransaction().begin();

		 //save this specific record
		 hibernateSession.update(m);
		
		 // Commit transaction
		 hibernateSession.getTransaction().commit();
		
		 hibernateSession.close();  
				    
		 return;  
	}

	public static void deleteMileage(int r) {
//		System.out.println("DEBUG: Deleting record " + r);
		if (factory == null)
			setupFactory();
		 // Get current session
		 Session hibernateSession = factory.openSession();

		 // Begin transaction
		 hibernateSession.getTransaction().begin();

		 MileageRecord m = 
                 (MileageRecord)hibernateSession.
                 get(MileageRecord.class, (Integer)r); 
		 hibernateSession.delete(m); 
		
		 // Commit transaction
		 hibernateSession.getTransaction().commit();
		
		 hibernateSession.close();  
				    
		 return;  
	}

	
	
	public static List<MileageRecord> getRecords(int userid){
		if (factory == null)
			setupFactory();
		 // Get current session
		 Session hibernateSession = factory.openSession();

		 // Begin transaction
		 hibernateSession.getTransaction().begin();
		 
		 //including category
		 //using prepared query to protect against SQL injection
		 String sql = "FROM " 
				 + MileageRecord.class.getName() 
				 + " WHERE userid=" + userid
				 + " ORDER BY mileage ASC";
		 
//		 System.out.println("DEBUG: query:" + sql);
			
		 
          List<MileageRecord> mRecords = hibernateSession.
        		  	createQuery(sql, MileageRecord.class).
        		  	
               	getResultList();
         
         // Commit transaction
         hibernateSession.getTransaction().commit();
        	 hibernateSession.close();  
        	 if (mRecords.size() == 0)
        		 return null;
        	 
        	 //calculate MPG & averages
        	 //start at 1; ignore first record
        	 MileageRecord averages = new MileageRecord();
        	 double sumMiles = 0;
        	 double sumGallons = mRecords.get(0).getGallons();
        	 double sumMPG = 0;
        	 double sumPrice = mRecords.get(0).getPrice();
        	 double sumTotal = mRecords.get(0).getTotal();
        	 
        	 for (int i = 1; i < mRecords.size(); i++) {
        		 double oldMiles = mRecords.get(i - 1).getMileage();
        		 double newMiles = mRecords.get(i).getMileage();
        		 double distance = newMiles - oldMiles;
        		 double gallons = mRecords.get(i).getGallons();
        		 double mpg = distance/gallons;
        		 mpg = (int)(mpg * 100 + .5) / 100.0;
        		 if (distance < 0 || gallons <= 0)
        			 mRecords.get(i).setMpg(0);
        		 else
        			 mRecords.get(i).setMpg(mpg);
        		 
        		 sumMiles += distance;
        		 sumGallons += gallons;
        		 sumMPG += mpg;
        		 sumPrice += mRecords.get(i).getPrice();
        		 sumTotal += mRecords.get(i).getTotal();
        	 }
        	 
        	 //mileage and MPG don't apply for 1st record, so n is 1 smaller
        	 averages.setMileage (roundTo2(sumMiles/(mRecords.size() - 1)));
        	 averages.setMpg(roundTo2(sumMPG/(mRecords.size() - 1)));
        	 
        	 averages.setPrice(roundTo2(sumPrice/mRecords.size()));
        	 averages.setGallons(roundTo2(sumGallons/mRecords.size()));
        	 averages.setTotal(roundTo2(sumTotal/mRecords.size()));
        	 
        	 //set dummy record in list to represent averages
        	 mRecords.add(averages);
        	 
 		return mRecords;
	}

	private static double roundTo2 (double d) {
		int temp = (int) (d * 100 + .5);
		d = temp/100.0;
		return d;
	}
	
	public static int addUser(User u) {
//		System.out.println("DEBUG: create user, password=" + u.getPassword());
		StrongPasswordEncryptor passwordEncryptor = new StrongPasswordEncryptor();
		String encrypted = passwordEncryptor.encryptPassword(u.getPassword());
		u.setPassword(encrypted);
		
		if (factory == null)
			setupFactory();
		 Session hibernateSession = factory.openSession();
		 hibernateSession.getTransaction().begin();

		 int i = (Integer)hibernateSession.save(u);  
		
		 hibernateSession.getTransaction().commit();
		 hibernateSession.close();  
			
//		 System.out.println("DEBUG: i=" + i);
		 
		 return i;  
	}

	public static User checkUser(String email, String password) {
		System.out.println("DEBUG: check password=" + password);

		if (factory == null)
			setupFactory();
		 Session hibernateSession = factory.openSession();
		 
		 //prepared statement to protect against injection
		 Query<User> sql = hibernateSession.createQuery("FROM User WHERE email=:email", User.class) ;
		 sql.setParameter("email", email);
		 User user = sql.getSingleResult(); 
		
//		 if (user == null) {
//			 System.out.println("DEBUG: user returned null");
//		 } else 
//			 System.out.println("DEBUG: user returned = " 
//				 + user.getEmail() + "/" + user.getFirstname());
//		 }
		 
		 try {
//			 hibernateSession.getTransaction().commit();
			 hibernateSession.close();  
		 } catch (Exception e) {
			 System.out.println("DEBUG: Error caught: " + e);
		 }

		 StrongPasswordEncryptor passwordEncryptor = new StrongPasswordEncryptor();
		 if (passwordEncryptor.checkPassword(password, user.getPassword())) {
			 System.out.println("DEBUG: Password passed");
			 return user; 
		 } else {
			 System.out.println("DEBUG: Password failed against encrypted");
			 return null;
		 }
	}

//	public static User getUser(String email) {
//		
//		if (factory == null)
//			setupFactory();
//		 Session hibernateSession = factory.openSession();
//		 hibernateSession.getTransaction().begin();
//
//		 String sql = "FROM " 
//				 + User.class.getName() 
//				 + " WHERE email='" + email + "'";
//		 User user = hibernateSession.
//     		  	createQuery(sql, User.class).getSingleResult(); 
//		
//		 hibernateSession.getTransaction().commit();
//		 hibernateSession.close();  
//		 
//		 return user;  
//	}

}
