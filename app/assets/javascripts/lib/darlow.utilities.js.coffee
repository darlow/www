Darlow.utilities = ((Darlow) ->
  module =
    name: 'utilities'
    location:
      # Extract key/value pairs from the window location hash
      # @param {String} [key] Name of a specific key to return
      # @returns {Object} keys/pairs
      # N.B. can also return whatever the value is for key, making the return type inconsistent; probably should refactor
      hash: (key) ->
        keypairs = {}
        if window.location.hash?
          hashvalue= window.location.hash.split('#')[1]
          if hashvalue?
            jQuery.each hasValue.split('&'), (i, pair) ->
              keyvalue = pair.split '='
              keypairs[keyvalue[0]] = keyvalue[1] || true
        if key?
          return keypairs[key]
        else
          return keypairs

    number:
      # Pad a number with zeros
      # @param {Integer} number Number to pad with zeros
      # @returns {String} zero-padded string representation of number
      pad: (number, length) ->
        str = "#{number}"
        str = "0#{str}" while str.length < length
        str

    string:
      # Convert a value in CSS pixels (e.g. 12px) to an integer
      # @param {String} value CSS pixels value
      # @returns {Number} value as an integer or floating point value
      pixelsToInteger: (value) ->
        return if value is ""
          0
        else
          if value.indexOf "." isnt -1
            parseFloat value.replace('px', '')
          else
            parseInt value.replace('px', ''), 10
  module
)(Darlow)
