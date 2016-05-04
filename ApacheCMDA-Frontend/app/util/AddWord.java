package util;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;
import models.*;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.io.IOUtils;
import org.apache.http.impl.conn.SystemDefaultDnsResolver;
import org.jsoup.Jsoup;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import play.data.Form;
import play.mvc.Controller;
import play.mvc.Http;
import play.mvc.Result;
import util.APICall;
import util.Constants;
import views.html.forum;
import views.html.workflow;
import views.html.workflow_edit;
import views.html.workflowdetail;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.channels.Channels;
import java.nio.channels.ReadableByteChannel;
import java.util.*;

/**
 * Created by zixiwei on 4/17/16.
 */
public abstract class AddWord extends Controller {
    protected Long wid;

    public abstract ObjectNode readInput(Form<?> form, Long wid);
    public abstract Result createOutput(ObjectNode jnode);

    public final Result returnOutput(Form<?> form, Long wid) {
        ObjectNode jnode = readInput(form, wid);
        return createOutput(jnode);
    }
}
