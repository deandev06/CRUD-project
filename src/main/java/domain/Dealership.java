package domain;


import jakarta.persistence.*;
import persistence.factories.DAOFactory;

import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "Dealership")
public class Dealership {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(nullable = false, name = "id")
    private Integer id;

    @OneToMany(mappedBy = "dealership" , fetch=FetchType.EAGER)
    private Set<Vehicle> vehicles;

    public Dealership() {

    }

    public void addVehicle(Vehicle vehicle) {

        vehicles.add(vehicle);
    }
    public void deleteVehicle(Integer id) {
        Vehicle vehicle = DAOFactory.getFactory().getVehicleDAO().findById(id);
        DAOFactory.getFactory().getVehicleDAO().remove(vehicle);
    }

    public Set<Vehicle> getVehicles() {
        return vehicles;
    }

    public void setVehicles(Set<Vehicle> vehicles) {
        this.vehicles = vehicles;
    }

    public Dealership(Set<Vehicle> vehicles) {
        this.vehicles = vehicles;
    }

    public void save() {
        DAOFactory.getFactory().getDealershipDAO().persist(this);
    }

    public Set<Vehicle> getAllVehicles() {
        return DAOFactory.getFactory().getVehicleDAO().findAll();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }



}
