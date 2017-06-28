class SepaApi
  URL='https://sepa.utem.cl/rest/api/v1'
  AUTH = {username: 'g0MqAOTcqZ', password: 'a451ba629a384c3238fa709dddf0363d'}


  def getEstudiante(rut)
    salida = Student.new
    if rut!=nil
      uri = '/utem/estudiantes/'
      respuesta = HTTParty.get(URL+uri+rut.to_s, basic_auth: AUTH)
      case respuesta.response.code.to_i
        when 200
          salida.rut = respuesta['rut']
          salida.name = respuesta['nombres']
          salida.last_name = respuesta['apellidos']
          salida.email = respuesta['email']
          carrera= getCarrera(rut)
          salida.career_id = carrera[:carrera_id]
        when 404
          salida = Student.new
      end
    end
    return salida
  end

  def getCarrera(rut)
    salida = []
    if rut!=nil
      uri = '/utem/estudiantes/'+rut.to_s+'/cohortes/ultimo'
      respuesta = HTTParty.get(URL+uri, basic_auth: AUTH)
      case respuesta.response.code.to_i
        when 200
          carreraPersistir(respuesta)
          salida ={carrera_id: (Career.find_by_namecareer(respuesta['nombreCarrera'])).id}
      end
    end
    return salida
  end

  def carreraPersistir(cohorte)
    uri = '/info/carrera/'
    if cohorte!=nil
      codigo = cohorte['codigoCarrera']
      if !Career.find_by_codigo(codigo)
        respuesta = HTTParty.get(URL+uri+codigo.to_s, basic_auth: AUTH)
        Career.create(codigo: codigo.to_i, namecareer: respuesta['nombre'])
      end
    end
  end

  def getDocente(rut)
    salida  = Professor.new
    uri = '/academia/docentes/'
    if rut!= nil
      respuesta = HTTParty.get(URI.encode(URL+uri+rut.to_s), basic_auth: AUTH)
        case respuesta.response.code.to_i
          when 200
            salida.name = respuesta['nombres']
            salida.last_name = respuesta['apellidos']
            salida.email = respuesta['email']
            salida.rut = respuesta['rut']
          when 404
          salida = nil
        end
    end
      return salida
  end

  end
