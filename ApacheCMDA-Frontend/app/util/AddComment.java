package util;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;
import controllers.routes;
import models.Comment;
import play.data.Form;
import play.mvc.Result;

import java.util.Date;

/**
 * Created by zixiwei on 4/17/16.
 */
public class AddComment extends AddWord {

    @Override
    public ObjectNode readInput(Form<?> form, Long wid) {
        Form<Comment> f = ((Form<Comment>) form).bindFromRequest();
        this.wid = wid;

        ObjectMapper mapper = new ObjectMapper();
        ObjectNode jnode = mapper.createObjectNode();
        try {
            jnode.put("userID", session("id"));
            jnode.put("timestamp", new Date().getTime());
            jnode.put("workflowID", wid);
            jnode.put("Content", f.field("content").value());
        }catch(Exception e) {
            flash("error", "Form value invalid");
        }
        return jnode;
    }

    @Override
    public Result createOutput(ObjectNode jnode) {
        JsonNode commentResponse = Comment.create(jnode);
        if (commentResponse == null || commentResponse.has("error")) {
            //Logger.debug("Create Failed!");
            if (commentResponse == null) flash("error", "Create Comment error.");
            else flash("error", commentResponse.get("error").textValue());
            return redirect(controllers.routes.WorkflowController.workflowDetail(wid));
        }
        flash("success", "Create Comment successfully.");
        return redirect(routes.WorkflowController.workflowDetail(wid));
    }
}

