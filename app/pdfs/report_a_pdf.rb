class ReportAPdf < Prawn::Document
    require "open-uri"
      def initialize(certificado, usuarios,layout)
        super(:page_layout => :portrait , :pages_size => "A4", :page_number => "1")
        @certificado = certificado
        @name = usuarios[0].name
        @title = usuarios[0].title
        @lastname = usuarios[0].lastName
        @serie = certificado[0].serie
        @folio = usuarios[0].folio
        @texto = certificado[0].texto
        @fondo = certificado[0].imagen
        header
        text_content
        table_content
        layout
      
        
      end
    
      def header
       
      end
  
      
      def text_content
        y_position = cursor - 150
        y_position1 = cursor - 200
        y_position2 = cursor - 215
        y_position3 = cursor - 340
        y_position4 = cursor - 630
        y_position5 = cursor - 550
  
       
        image open(@fondo), :height => 720
    
  
        bounding_box([85, y_position2], :width => 620) do
          text "#{@title} #{@name} #{@lastname}", size: 26, style: :bold, :align => :left
        end
      
  
        bounding_box([420, y_position4], :width => 370) do
          text "#{@folio}", size: 13, style: :bold
        end
    
      end
    
      def table_content
  
      end
    
      def product_rows
        [['#', 'Nombre', 'Texto']] +
          @certificados.map do |certificado|
          [certificado.id, certificado.nombre, certificado.texto]
        end
      end
    end