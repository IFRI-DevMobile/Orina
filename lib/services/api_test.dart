import 'api_services.dart';

Future<void> main() async {
  final api = ApiService();

  // Test GET
  await testGet(api);

  // Test POST
  await testPost(api);

  // Test PUT
  await testPut(api);

  // Test DELETE
  await testDelete(api);
}

//  Tests 

Future<void> testGet(ApiService api) async {
  try {
    final response = await api.client.get('/users/1'); // GET user id 1
    print('GET success: ${response.data}');
  } catch (e) {
    print('GET error: $e');
  }
}

Future<void> testPost(ApiService api) async {
  try {
    final response = await api.client.post(
      '/users',
      data: {
        "name": "Test User",
        "username": "testuser",
        "email": "test@example.com",
      },
    );
    print('POST success: ${response.data}');
  } catch (e) {
    print('POST error: $e');
  }
}

Future<void> testPut(ApiService api) async {
  try {
    final response = await api.client.put(
      '/users/1', // Met à jour l'utilisateur 1
      data: {
        "name": "Updated User",
        "username": "updateduser",
        "email": "update@example.com",
      },
    );
    print('PUT success: ${response.data}');
  } catch (e) {
    print('PUT error: $e');
  }
}

Future<void> testDelete(ApiService api) async {
  try {
    final response = await api.client.delete('/users/1'); // Supprime l'utilisateur 1
    print('DELETE success: ${response.data}');
  } catch (e) {
    print('DELETE error: $e');
  }
}
