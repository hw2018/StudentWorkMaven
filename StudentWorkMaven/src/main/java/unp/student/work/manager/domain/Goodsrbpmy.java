package unp.student.work.manager.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "goo_rbp")
public class Goodsrbpmy {
	@Id
	// @GenericGenerator(name="assigned",strategy="assigned")
	// @GeneratedValue(generator="assigned")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "studentid")
	private PersonPersonInfo personPersonInfo;

	@Column(name = "name")
	private String name;

	@Column(name = "price")
	private Double price;

	@Column(name = "des")
	private String des;

	@Column(name = "contact")
	private String contact;

	@Column(name = "time")
	private Date time;

	public Goodsrbpmy() {
		super();
	}

	public Goodsrbpmy(PersonPersonInfo personPersonInfo, String name) {
		super();
		this.personPersonInfo = personPersonInfo;
		this.name = name;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public PersonPersonInfo getPersonPersonInfo() {
		return personPersonInfo;
	}

	public void setPersonPersonInfo(PersonPersonInfo personPersonInfo) {
		this.personPersonInfo = personPersonInfo;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public String getDes() {
		return des;
	}

	public void setDes(String des) {
		this.des = des;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

}
