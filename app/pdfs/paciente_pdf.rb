#!/bin/env ruby
# encoding: utf-8

class PacientePdf < Prawn::Document
  def initialize(paciente, view)
    super(
      :background  => Rails.root.join("app/assets/images/backa4v.jpg"),
      :margin      => [40, 40, 40, 40])
    @paciente = paciente
    @view = view

    paciente_number       
    encabezado
  end
  
  def paciente_number
    
    text "Centro Médico - La Familia", size: 20, style: :bold, align: :center
    text "_________________________________________________________", size: 10, align: :center
  end

  def encabezado
    move_down 20    
    text "DATOS PERSONALES", size: 11, style: :bold_italic
    table encabezado_line_rows do
      columns(0..2).size = 9
      row(0..5).column(0..5).borders = []
    end    
  end

  def encabezado_line_rows
    [["Nombre completo: #{@paciente.persona.name}", 
      "                              ",
      "Paciente No.: #{@paciente.numero_paciente}"]] +

    [["Fecha: #{@paciente.created_at}",
      "                              ",
      "Cédula: #{@paciente.persona.cedula}"]] +

    [["Teléfono: #{@paciente.persona.telefono}",
      "                              ",
      "Sexo: #{@paciente.persona.sexo}"]] +


    [["Seguro Social: #{@paciente.persona.seguro_social}", 
      "                              ",
      "Contacto de emergencia: #{@paciente.persona.contacto_emergencia}"]] + 

    [["Fecha de nacimiento: #{@paciente.persona.fecha_nacimiento}", 
      "                              ",
      "Teléfono de emergencia: #{@paciente.persona.telefono}"]] +

    [["Direccion: #{@paciente.persona.direccion}", 
      "                              ",
      ""]]
  end
end