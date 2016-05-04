package util;

import com.google.gson.Gson;
import models.User;

/**
 * Created by zixiwei on 4/17/16.
 */
public class UserNotValidState implements State {

    @Override
    public String doAction(Context context, User user) {
        System.out.println("UserName and password not match");
        context.setState(this);
        // // return Common.badRequestWrapper("User is not valid");
        // JsonObject jsonObject = new JsonObject();
        // jsonObject.addProperty("error", "UserName and password not match");
        // return ok(new Gson().toJson(jsonObject));
        LoginErrorFactory factory = new LoginErrorFactory();
        return new Gson().toJson(factory.getLoginError("WrongPassword").errorResponse());
    }

    @Override
    public String toString() {
        return "User Not Valid State";
    }
}
