package DB;

/**
 * Created by Reda BENCHRAA on 10/12/2016.
 */
public class dataAccessException extends RuntimeException {
    private static final long serialVersionUID = 1L;

    public dataAccessException(String message) {
        super(message);
    }

    public dataAccessException(String message, Throwable cause) {
        super(message, cause);
    }

    public dataAccessException(Throwable cause) {
        super(cause);
    }
}

