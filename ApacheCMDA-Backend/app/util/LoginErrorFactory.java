package util;

public class LoginErrorFactory {
	public LoginError getLoginError(String errorType) {
		if(errorType == null || errorType.equals("WrongPassword")) {
			return new WrongPasswordError();
		}

		if(errorType.equals("EmptyEmail")) {
			return new EmptyEmailError();
		}

		if(errorType.equals("EmptyPassword")) {
			return new EmptyPasswordError();
		}

		if(errorType.equals("NoSuchEmail")) {
			return new NoSuchEmailError();
		}

		return new WrongPasswordError();
	}
}