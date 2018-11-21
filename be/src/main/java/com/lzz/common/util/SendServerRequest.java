package com.lzz.common.util;

import org.json.JSONException;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

public class SendServerRequest {
    public static JSONObject sendJSONRequest(URL url, String request)
    {
        HttpURLConnection connection = null;
        try
        {
            connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("POST");
            connection.setRequestProperty("Content-Type", "application/json");
            connection.setDoInput(true);
            connection.setDoOutput(true);

            DataOutputStream writer = new DataOutputStream(connection.getOutputStream());
            writer.write(request.getBytes("UTF-8"));
            writer.flush();
            writer.close();

            return parseResponse(connection);
        }
        catch (Exception e)
        {
            System.out.println("An error occurred: " + e.getMessage());
            return null;
        }
        finally
        {
            if (connection != null)
            {
                connection.disconnect();
            }
        }
    }

    public static JSONObject parseResponse(HttpURLConnection connection) throws IOException, JSONException
    {
        String line;
        BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
        StringBuilder response = new StringBuilder();

        while ((line = reader.readLine()) != null)
        {
            response.append(line).append('\r');
        }
        reader.close();

        return new JSONObject(response.toString());
    }
}
