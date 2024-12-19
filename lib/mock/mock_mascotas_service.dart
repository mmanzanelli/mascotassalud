import 'package:mascotassalud/models/mascota_model.dart';

class MockMascotasService {
  static List<Mascota> fetchMascotas() {
    return [
      Mascota(
        idMascota: 1,
        idUsuario: 1,
        nombre: 'Firulais',
        idTipoMascota: 1,
        idRaza: 1,
        fechaNacimiento: DateTime(2020, 5, 10),
        sexo: 'Macho',
        numeroIdentificacion: '12345',
        color: 'Marrón',
        esterilizado: true,
        foto:
            'https://images.unsplash.com/photo-1558788353-f76d92427f16', // URL simulada
      ),
      Mascota(
        idMascota: 2,
        idUsuario: 1,
        nombre: 'Miau',
        idTipoMascota: 2,
        idRaza: 2,
        fechaNacimiento: DateTime(2018, 9, 15),
        sexo: 'Hembra',
        numeroIdentificacion: '67890',
        color: 'Negro',
        esterilizado: false,
        foto:
            'https://images.unsplash.com/photo-1606107557194-0a0866b0ae42', // URL simulada
      ),
    ];
  }
}
