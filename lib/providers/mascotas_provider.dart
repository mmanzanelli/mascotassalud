import 'package:flutter/material.dart';
import 'package:mascotassalud/models/mascota_model.dart';
import 'package:mascotassalud/mock/mock_mascotas_service.dart';

class MascotasProvider extends ChangeNotifier {
  List<Mascota> _mascotas = [];

  List<Mascota> get mascotas => _mascotas;

  MascotasProvider() {
    // Cargar datos simulados al inicializar
    _mascotas = MockMascotasService.fetchMascotas();
  }

  void setMascotas(List<Mascota> mascotas) {
    _mascotas = mascotas;
    notifyListeners();
  }

  void updateMascota(int idMascota, Mascota updatedMascota) {
    final index = _mascotas.indexWhere((m) => m.idMascota == idMascota);
    if (index != -1) {
      _mascotas[index] = updatedMascota;
      notifyListeners(); // Notifica a los widgets dependientes
    }
  }
}
