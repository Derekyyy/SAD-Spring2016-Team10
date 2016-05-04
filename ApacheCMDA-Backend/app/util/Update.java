package util;

import play.mvc.Result;

/**
 * Created by ethan on 4/18/16.
 */
public interface Update {
    public Result updateById(long id);
    public Result updateByName(String oldName);
}
