package murach.business;

import java.io.Serializable;
import java.util.Arrays;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.persistence.Column;

@Entity
@Table(name = "\"User\"")
public class User implements Serializable {

    private String firstName;
    private String lastName;
    private String email;
    private String dateOfBirth;
    private String source;
    private String[] offers;
    private String contactMethod;

    public User() {
        this.firstName = "";
        this.lastName = "";
        this.email = "";
        this.dateOfBirth = "";
        this.source = "";
        this.contactMethod = "";
        this.offers = new String[0];
    }

    public User(String firstName, String lastName, String email, String dateOfBirth,
                String source, String[] offers, String contactMethod) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.dateOfBirth = dateOfBirth;
        this.source = source;
        this.offers = offers;
        this.contactMethod = contactMethod;
    }

    @Column(name = "firstname")
    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    @Column(name = "lastname")
    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    @Id
    @Column(name = "email")
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Column(name = "dateofbirth")
    public String getDateOfBirth() {
        return dateOfBirth;
    }
    
    public void setDateOfBirth(String dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }
    
    @Column(name = "source")
    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source;
    }

    @Column(name = "offers")
    public String[] getOffers() {
        return offers;
    }

    public void setOffers(String[] offers) {
        this.offers = offers;
    }

    @Column(name = "contactmethod")
    public String getContactMethod() {
        return contactMethod;
    }

    public void setContactMethod(String contactMethod) {
        this.contactMethod = contactMethod;
    }

    @Override
    public String toString() {
        return "User [firstName=" + firstName + ", lastName=" + lastName +
               ", email=" + email + ", dateOfBirth=" + dateOfBirth + 
               ", source=" + source + ", offers=" + Arrays.toString(offers) + 
               ", contactMethod=" + contactMethod + "]";
    }
}
