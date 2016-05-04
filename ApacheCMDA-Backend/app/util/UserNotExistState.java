package util;

import com.google.gson.Gson;
import models.User;

/**
 * Created by zixiwei on 4/17/16.
 */
public class UserNotExistState implements State {

    @Override
    public String doAction(Context context, User user) {
        System.out.println("User not exist");
        context.setState(this);
        // JsonObject jsonObject = new JsonObject();
        // jsonObject.addProperty("error", "User not exists");
        // return ok(new Gson().toJson(jsonObject));
        LoginErrorFactory factory = new LoginErrorFactory();
        return new Gson().toJson(factory.getLoginError("NoSuchEmail").errorResponse());
    }

    @Override
    public String toString() {
        return "User Not Valid State";
    }
}
