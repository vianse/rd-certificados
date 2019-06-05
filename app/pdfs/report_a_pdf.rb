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
        #This inserts an image in the pdf file and sets the size of the image
      end
  
      
      def text_content
        y_position = cursor - 150
        y_position1 = cursor - 200
        y_position2 = cursor - 215
       
        y_position3 = cursor - 340
        y_position4 = cursor - 630
        y_position5 = cursor - 550
  
        #indent 0, 0 do
          image open(@fondo), :height => 720
        #end
        #image ::Rails.root.join('public','images','Certificado.png'),:width =>555, :height => 720
        #image open(@fondo),:width =>600, :height => 720, :size => "a4"
        # The cursor for inserting content starts on the top left of the page. Here we move it down a little to create more space between the text and the image inserted above
       
       
        # The bounding_box takes the x and y coordinates for positioning its content and some options to style it
         #bounding_box([0, y_position], :width => 270, :height => 300) do
         # image ::Rails.root.join('public','images','Certificado.png')
        #   text "Lorem ipsum", size: 15, style: :bold
        #   text "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse interdum semper placerat. Aenean mattis fringilla risus ut fermentum. Fusce posuere dictum venenatis. Aliquam id tincidunt ante, eu pretium eros. Sed eget risus a nisl aliquet scelerisque sit amet id nisi. Praesent porta molestie ipsum, ac commodo erat hendrerit nec. Nullam interdum ipsum a quam euismod, at consequat libero bibendum. Nam at nulla fermentum, congue lectus ut, pulvinar nisl. Curabitur consectetur quis libero id laoreet. Fusce dictum metus et orci pretium, vel imperdiet est viverra. Morbi vitae libero in tortor mattis commodo. Ut sodales libero erat, at gravida enim rhoncus ut."
        #end
  
       
        
        #bounding_box([350, y_position1], :width => 270) do
         # text "A: ", size: 15
        #end
  
        bounding_box([85, y_position2], :width => 620) do
          text "#{@title} #{@name} #{@lastname}", size: 26, style: :bold, :align => :left
        end
        #  bounding_box([50, y_position3], :width => 620) do
        #    text "#{@texto}",  size: 15, style: :bold, :align => :center, :color =>  "003f81"
        #  end
  
        bounding_box([420, y_position4], :width => 370) do
          text "#{@folio}", size: 13, style: :bold
        end
    
      end
    
      def table_content
        # This makes a call to product_rows and gets back an array of data that will populate the columns and rows of a table
        # I then included some styling to include a header and make its text bold. I made the row background colors alternate between grey and white
        # Then I set the table column widths
        # table product_rows do
        #   row(0).font_style = :bold
        #   self.header = true
        #   self.row_colors = ['DDDDDD', 'FFFFFF']
        #   self.column_widths = [40, 300, 200]
        # end
      end
    
      def product_rows
        [['#', 'Nombre', 'Texto']] +
          @certificados.map do |certificado|
          [certificado.id, certificado.nombre, certificado.texto]
        end
      end
    end