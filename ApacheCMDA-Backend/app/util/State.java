package util;

import models.User;

/**
 * Created by zixiwei on 4/17/16.
 */
public interface State {
    public String doAction(Context context, User user);
}
