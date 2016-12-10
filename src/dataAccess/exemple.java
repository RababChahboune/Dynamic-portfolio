package dataAccess;

/**
 * Created by Reda BENCHRAA on 10/12/2016.
 */
public class exemple {
    private final static String tableName = "client";

	/*
	 * public static void main(String[] args) throws SQLException { ProduitDao p
	 * = new ProduitDao(); DAOFactory.setDbname("gestion_stock"); ProduitForm pp
	 * = p.getProduitFormList(0, 10).get(1); System.out.println(pp.getName() +
	 * " " + pp.getDescription()); }
	 */

    /**
     * select all produit in the database stock
     *
     * @return
     * @throws SQLException
     */
    public static ArrayList<ClientForm> getClientFormList() throws SQLException {

        // get database connection
        DAOFactory.setDbname("gestion_vente");
        Connection con = DAOFactory.getInstance().getConnection();

        String sql = "SELECT * FROM `" + tableName + "` ORDER BY id DESC";
        // get customer data from database
        ResultSet result = DAOFactory.select(con, sql);

        ArrayList<ClientForm> list = new ArrayList<ClientForm>();

        while (result.next()) {
            list.add(map(result));
        }
        result.close();

        return list;
    }

    /**
     * Find produit in database by id
     *
     * @param id
     * @return
     * @throws DAOConfigurationException
     * @throws SQLException
     */
    public static ClientForm find(long id) throws DAOConfigurationException,
            SQLException {
        ClientForm client = null;
        // get database connection
        DAOFactory.setDbname("gestion_vente");
        Connection con = DAOFactory.getInstance().getConnection();

        String sql = "SELECT * FROM `" + tableName + "` WHERE id = ?";
        // get customer data from database
        ResultSet result = DAOFactory.select(con, sql, id);

        if (result.next()) {
            client = map(result);
        }

        return client;
    }

    /**
     * add one recored client to database
     *
     * @param client
     * @throws SQLException
     */
    public static int insert(ClientForm client) throws SQLException {
        DAOFactory.setDbname("gestion_vente");
        Connection con = DAOFactory.getInstance().getConnection();

        String sql = "INSERT INTO " + tableName
                + " (Nom, Adresse, Numero) values (?, ? , ?)";

        return DAOFactory.update(con, sql, client.getNom(),
                client.getAdresse(), client.getNumero());
    }

    /**
     * Update client record in database by id
     *
     * @param client
     * @throws SQLException
     */
    public static int update(ClientForm client) throws SQLException {
        DAOFactory.setDbname("gestion_vente");
        Connection con = DAOFactory.getInstance().getConnection();

        String sql = "UPDATE "+ tableName +" SET Nom = ? , Adresse = ? , Numero = ? WHERE id = ?";

        return DAOFactory.update(con, sql, client.getNom(),
                client.getAdresse(), client.getNumero(), client.getId());
    }

    /**
     * Delete client record form database by id
     *
     * @param client
     * @throws SQLException
     */
    public static int delete(ClientForm client) throws SQLException {
        DAOFactory.setDbname("gestion_vente");
        Connection con = DAOFactory.getInstance().getConnection();

        String sql = "DELETE FROM " + tableName + " WHERE id = ?";

        return DAOFactory.update(con, sql, client.getId());
    }

    /**
     * Simple méthode utilitaire permettant de faire la correspondance (le
     * mapping) entre une ligne issue de la table des utilisateurs (un
     * ResultSet) et un bean Utilisateur.
     *
     * @param resultSet
     * @return
     * @throws SQLException
     */
    private static ClientForm map(ResultSet resultSet) throws SQLException {
        ClientForm client = new ClientForm();
        client.setId(resultSet.getLong("id"));
        client.setNom(resultSet.getString("Nom"));
        client.setAdresse(resultSet.getString("Adresse"));
        client.setNumero(resultSet.getString("Numero"));
        return client;
    }
}
