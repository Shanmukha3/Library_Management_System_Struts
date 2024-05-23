package com.example;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.opensymphony.xwork2.ActionSupport;

public class DeleteBookAction extends ActionSupport {
	private int id;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String post() {
		Session session = FactoryProvider.getFactory().openSession();
		Transaction tx = null;

		try {
			tx = session.beginTransaction();

			// Load the existing book from the database using ID
			Book existingBook = session.get(Book.class, id);

			if (existingBook  != null) {
				// Delete the book
				session.remove(existingBook );

				tx.commit();
				addActionMessage("Article deleted successfully!");
				return SUCCESS;
			} else {
				addActionError("Article not found with ID: " + id);
				return ERROR;
			}
		} catch (Exception e) {
			if (tx != null && tx.isActive()) {
				tx.rollback();
			}
			addActionError("Error deleting Article: " + e.getMessage());
			return ERROR;
		} finally {
			session.close();
		}
	}
}