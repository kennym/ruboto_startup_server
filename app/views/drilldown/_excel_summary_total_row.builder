xml.Row do
  1.upto(dimension) { |n| xml.Cell('ss:StyleID'=>"Outer")}

  (@dimensions.size - dimension).times do |i|
    xml.Cell 'ss:Index' => "#{dimension + i + 1}", 'ss:StyleID'=>"Sum" do
      xml.Data '', 'ss:Type'=>"String"
    end
  end
  xml.Cell 'ss:Index' => "#{@dimensions.size + 1}", 'ss:StyleID'=>"Sum" do
    xml.Data result[:count], 'ss:Type'=>"Number"
  end
  xml.Cell 'ss:StyleID'=>"Sum" do
    xml.Data result[:volume], 'ss:Type' => "Number"
  end
  xml.Cell 'ss:StyleID'=>"Sum" do
    xml.Data result[:volume_compensated], 'ss:Type' => "Number"
  end
end
