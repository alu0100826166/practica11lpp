require 'date'
require 'spec_helper'
require 'bibliografia'


describe Bibliografia do
    before :each do
        serie = "Serie1"
        autores = Array.new
        autores = %w{ Autor1 Autor2 }
        isbn = { "isbn-1" => " 193778", "isbn-12" => " 978-19377" }
        @libro = Bibliografia::Libro.new(autores, "TituloLibro", serie, "Editorial Libro", "Numero Edicion Libro", Date.new(2015, 11, 17), isbn)
        
        
        serie2 = "Serie2"
        autores = Array.new
        autores = %w{ Autor1 Autor2 }
        issn = "1133-9721"
        @revista = Bibliografia::Revista.new(autores, "TituloRevista", serie2, "Editorial Revista", "Numero Edicion Revista", Date.new(2015, 11, 17), issn)
        
        
        autores = Array.new
        autores = %w{ Autor1 Autor2 }
        url = "www.libroelectronico.com"
        @doc = Bibliografia::DocumentoElectronico.new(autores, "TituloDoc", Date.new(2015, 11, 17), url)
        
        
        @Node = Struct.new(:prev, :value, :sig)
        @Lista = Bibliografia::ListaEnlazada.new(@libro)
    end #before each

########################################################PRUEBAS PRACTICA 10
    context "Referencias segun APA" do
        it "Debe existir clase de prueba" do
            autores = Array.new
            autores = ["Alejandro Alvaro", "Florentino Fernandez"]
            a=Bibliografia::Clase_Nueva.new(autores, "TITULO", Date.new(2015, 11, 17))
            expect(a.is_a?Bibliografia::Clase_Nueva).to eq(true)
        end
        
        it "Debe mostrar el nombre y apellidos de forma inversa" do
            autores = Array.new
            autores = ["Alejandro Alvaro", "Florentino Fernandez"]
            serie = "Serie1"
            isbn = { "isbn-1" => " 193778", "isbn-12" => " 978-19377" }
            @libro = Bibliografia::Libro.new(autores, "ZTituloLibro", serie, "Editorial Libro", "Numero Edicion Libro", Date.new(2015, 11, 14), isbn)
            
            @libro.getAutores()
        end
        
        it "Ordenado segun APA" do
            serie = "Serie1"
            autores = Array.new
            autores = ["Alejandro Alvaro", "Florentino Fernandez"]
            isbn = { "isbn-1" => " 193778", "isbn-12" => " 978-19377" }
            @libro = Bibliografia::Libro.new(autores, "ZTituloLibro", serie, "Editorial Libro", "Numero Edicion Libro", Date.new(2015, 11, 14), isbn)
            
            serie2 = "Serie2"
            autores1 = Array.new
            autores1 = ["Alejandro Alvaro", "Florentino Fernandez"]
            issn = "1133-9721"
            @revista = Bibliografia::Revista.new(autores1, "TituloRevista", serie2, "Editorial Revista", "Numero Edicion Revista", Date.new(2015, 11, 15), issn)
           
            @lista = Bibliografia::ListaEnlazada.new(@libro)
            @lista.insertar_delante(@revista)
            
            puts""
            puts "Comienzo sort: Mismos autores exactamente, ordena por fecha"
            puts @lista.sort
            puts "Final sort: Debe salir libro y luego revista"
        end
        
        it "Ordenado segun APA" do
            serie = "Serie1"
            autores = Array.new
            autores = ["Alejandro Alvaro"]
            isbn = { "isbn-1" => " 193778", "isbn-12" => " 978-19377" }
            @libro = Bibliografia::Libro.new(autores, "ZTituloLibro", serie, "Editorial Libro", "Numero Edicion Libro", Date.new(2015, 11, 14), isbn)
            
            serie2 = "Serie2"
            autores1 = Array.new
            autores1 = ["Alejandro Alvaro", "Florentino Fernandez"]
            issn = "1133-9721"
            @revista = Bibliografia::Revista.new(autores1, "TituloRevista", serie2, "Editorial Revista", "Numero Edicion Revista", Date.new(2015, 11, 15), issn)
           
            @lista = Bibliografia::ListaEnlazada.new(@libro)
            @lista.insertar_delante(@revista)
            puts""
            puts "Comienzo sort: Mismo primer autor, imprime primero el de solo un autor"
            puts @lista.sort
            puts "Final sort: Debe salir libro primero y luego revista"
        end
        
        it "Ordenado segun APA" do
            serie = "Serie1"
            autores = Array.new
            autores = ["Alejandro Alvaro", "Florentino Fernandez"]
            isbn = { "isbn-1" => " 193778", "isbn-12" => " 978-19377" }
            @libro = Bibliografia::Libro.new(autores, "ZTituloLibro", serie, "Editorial Libro", "Numero Edicion Libro", Date.new(2015, 11, 14), isbn)
            
            serie2 = "Serie2"
            autores1 = Array.new
            autores1 = ["Alejandro Alvaro", "Florentino Fernandez"]
            issn = "1133-9721"
            @revista = Bibliografia::Revista.new(autores1, "TituloRevista", serie2, "Editorial Revista", "Numero Edicion Revista", Date.new(2015, 11, 14), issn)
           
            @lista = Bibliografia::ListaEnlazada.new(@libro)
            @lista.insertar_delante(@revista)
            puts""
            puts "Comienzo sort: Mismos autores y misma fecha, ordena por titulo"
            puts @lista.sort
            puts "Final sort: Debe salir revista primero y luego libro"
        end
        
        it "Salida formateada con nombre autor y sangria" do
            serie = "Serie1"
            autores = Array.new
            autores = ["Alejandro Alvaro", "Florentino Fernandez"]
            isbn = { "isbn-1" => " 193778", "isbn-12" => " 978-19377" }
            @libro = Bibliografia::Libro.new(autores, "ZTituloLibro", serie, "Editorial Libro", "Numero Edicion Libro", Date.new(2015, 11, 14), isbn)
            
            serie2 = "Serie2"
            autores1 = Array.new
            autores1 = ["Alejandro Alvaro", "Florentino Fernandez"]
            issn = "1133-9721"
            @revista = Bibliografia::Revista.new(autores1, "TituloRevista", serie2, "Editorial Revista", "Numero Edicion Revista", Date.new(2015, 11, 14), issn)
           
            @lista = Bibliografia::ListaEnlazada.new(@libro)
            @lista.insertar_delante(@revista)
            
            puts ""
            puts "Salida formateada"
            @lista.extraer_delante()
            puts ""
        end
    end 
end
