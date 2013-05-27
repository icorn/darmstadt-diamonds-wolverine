package wolverine

import grails.converters.JSON
import org.json.simple.JSONArray
import org.json.simple.JSONObject

import javax.net.ssl.HttpsURLConnection

class PushService {

	def String pushToAndroid(jsonData, collapseKey)
	{
		def gcmUrl = new URL("https://android.googleapis.com/gcm/send")
		def apiKey = "AIzaSyA1tFuwDHOxKNyNBwUJMo61lOWW4p-cZp4"
		def registrationIDs =
			[
					"APA91bFowms-ub00d5ISeRzPprRKzLkanT7pSl7MmO29gdIsfjMr3JWhFkYjAIJbXlR0EauolNIgazZG8UjSyoEO81WQ1o3P7ss6xdYs-oyTjsfTO818cHR5GEflg0CBRHcqetZ_Zv5ZKLthnVNLWIaG1fIykBx2pQ",
					"APA91bEjg-1RkyfzGOKEFrKir3-PUxGY6M_265anEVXfoNeSqE1PQOTvJTLbmF9ZizHpS06kzZ7jMdCKVz7i4rOF5idZp-qFRYhD0xpIsbhKsWvZtvYNlig1Vx2LmzRxQJoKlxb0re-4ucqpCl7z9hVy-AWdZ9LjRw",
					"xyasdf"
			]

		// Set up JSON data
		JSONObject jsonFields = new JSONObject();
		JSONArray jsonFieldIDs = new JSONArray();

		for (int i=0; i < registrationIDs.size(); i++)
			jsonFieldIDs.add(registrationIDs[i])

		jsonFields.put("registration_ids", jsonFieldIDs)
		jsonFields.put("data", jsonData)

		if (collapseKey)
			jsonFields.put("collapse_key", collapseKey)

		// Create connection and set up post request
		HttpsURLConnection con = (HttpsURLConnection)gcmUrl.openConnection();
		con.setRequestMethod("POST");

		con.setRequestProperty("Content-Type","application/json");
		con.setRequestProperty("Authorization", "key=" + apiKey);
		con.setDoOutput(true);
		con.setDoInput(true);

		// Send data
		DataOutputStream output = new DataOutputStream(con.getOutputStream());
		output.writeBytes(jsonFields.toJSONString());
		output.close();

		// Get response
		def input = new DataInputStream(con.getInputStream())
		def buffer = new StringBuffer(100000)

		for (int c = input.read(); c != -1; c = input.read())
			buffer.append((char)c)

		input.close();



		def responseObject = JSON.parse(buffer.toString())


		// Return response
		return buffer.toString()
	}


}
