package net.fbla.ahs.model;

public class Partner {
	private int id;
    private String contactName;
    private String orgName;
    private String typOrg;
    private String contactEmail;
    private String contactPhone;
    public Partner() {}
    public Partner(String contactName, String orgName, 
    		String typOrg, String contactEmail, String contactPhone)
    {
    	this.contactName = contactName;
    	this.orgName = orgName;
    	this.typOrg = typOrg;
    	this.contactEmail = contactEmail;
    	this.contactPhone = contactPhone;
    	
    }
    public Partner(int id, String contactName, String orgName,
    		String typOrg, String contactEmail, String contactPhone)
    {
    	this.id =id;
    	this.contactName = contactName;
    	this.orgName = orgName;
    	this.typOrg = typOrg;
    	this.contactEmail = contactEmail;
    	this.contactPhone = contactPhone;
    	
    }
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getContactName() {
		return contactName;
	}
	public void setContactName(String contactName) {
		this.contactName = contactName;
	}
	public String getOrgName() {
		return orgName;
	}
	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}
	public String getTypOrg() {
		return typOrg;
	}
	public void setTypOrg(String typOrg) {
		this.typOrg = typOrg;
	}
	public String getContactEmail() {
		return contactEmail;
	}
	public void setContactEmail(String contactEmail) {
		this.contactEmail = contactEmail;
	}
	public String getContactPhone() {
		return contactPhone;
	}
	public void setContactPhone(String contactPhone) {
		this.contactPhone = contactPhone;
	}
    
    

}
