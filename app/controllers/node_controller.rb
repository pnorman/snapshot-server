class NodeController < ApplicationController
  require 'xml/libxml'

  #after_filter :compress_output

  # Dump the details on a node given in params[:id]
  def read
    node = Node.find(params[:id])
    if node
      response.headers['Last-Modified'] = node.tstamp.rfc822
      render :text => node.to_xml.to_s, :content_type => "text/xml"
    else
      render :text => "", :status => :gone
    end
  end
end