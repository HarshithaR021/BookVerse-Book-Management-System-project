package Beans;

import java.io.Serializable;

public class ManagementBean implements Serializable {
    private String adminId;
    private String adminPassword;
    public ManagementBean(){}

    public String getAdminId() {
        return adminId;
    }

    public void setAdminId(String adminId) {
        this.adminId = adminId;
    }

    public String getAdminPassword() {
        return adminPassword;
    }

    public void setAdminPassword(String adminPassword) {
        this.adminPassword = adminPassword;
    }



}
