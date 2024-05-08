package domain;

import persistence.factories.DAOFactory;

public class DealershipFacade {
    private static DealershipFacade instance;
    public static DealershipFacade getInstance() {
        if (instance == null)
            instance = new DealershipFacade();

        return instance;
    }
    public Dealership getDealership() {
        return DAOFactory.getFactory().getDealershipDAO().findById(1);

    }


}