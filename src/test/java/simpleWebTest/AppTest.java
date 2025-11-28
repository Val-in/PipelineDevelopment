package simpleWebTest;

import com.sun.net.httpserver.HttpExchange;
import org.junit.jupiter.api.Test;
import java.io.ByteArrayOutputStream;
import java.net.URI;
import simpleWeb.App;


import static org.mockito.Mockito.*;
import static org.junit.jupiter.api.Assertions.*;

class AppTest {

    @Test
    void rootHandlerTest() throws Exception {

        HttpExchange exchange = mock(HttpExchange.class);
        ByteArrayOutputStream os = new ByteArrayOutputStream();
        when(exchange.getResponseBody()).thenReturn(os);
        when(exchange.getRequestURI()).thenReturn(new URI("/"));

        App.RootHandler handler = new App.RootHandler();
        handler.handle(exchange);

        String response = os.toString();
        assertEquals("Java web server is running correctly! GitHub Actions was added!", response);
    }
}
