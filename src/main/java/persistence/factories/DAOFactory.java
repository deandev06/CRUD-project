package persistence.factories;


import persistence.interfaces.*;

public abstract class DAOFactory {

    private static DAOFactory factory;

    public static DAOFactory getFactory() {
        return factory;
    }

    public static void setFactory(Class<? extends DAOFactory> factory) {
        try {
            DAOFactory.factory = factory.getDeclaredConstructor().newInstance();
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("Unable to create DAOFactory: " + factory);
        }
    }

    public abstract IVehicleDAO getVehicleDAO();
    public abstract IDealershipDAO getDealershipDAO();
    public abstract IBoatDAO getBoatDAO();
    public abstract IPlaneDAO getPlaneDAO();
    public abstract ITankDAO getTankDAO();
    public abstract ICarDAO getCarDAO();


}
