class ReportBPdf < Prawn::Document
    require "open-uri"
      def initialize(certificado, usuarios,layout)
        super(:page_layout => :landscape, :page_size => "LEGAL")
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
        #This inserts an image in the pdf file and sets the size of the image
      end
  
      
      def text_content
        y_position = cursor - 150
        y_position1 = cursor - 200
        y_position2 = cursor - 180
       
        y_position3 = cursor - 340
        y_position4 = cursor - 340
        y_position5 = cursor - 550
  
     
          image open(@fondo),:width =>940, :height => 520
       
  
        bounding_box([0, y_position2], :width => 940) do
          text "#{@title} #{@name} #{@lastname}", size: 30, style: :bold, :align => :center
        end
     
        bounding_box([0, y_position4], :width => 940) do
          text "#{@folio}", style: :bold, :align => :center
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