package util;

import com.google.gson.JsonObject;

public class WrongPasswordError implements LoginError {
	@Override
	public JsonObject errorResponse() {
		JsonObject jsonObject = new JsonObject();
		jsonObject.addProperty("error", "Wrong password");
		return jsonObject;
	}
}