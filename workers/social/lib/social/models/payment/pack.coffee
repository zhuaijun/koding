JPaymentBase = require './base'

module.exports = class JPaymentPack extends JPaymentBase

  { permit } = require '../group/permissionset'

  @share()

  @set
    sharedMethods   :
      static        : [
        'create'
        'removeByCode'
      ]
      instance      : [
        'modify'
        'remove'
        'fetchProducts'
        'updateProducts'
      ]
    schema          :
      planCode      :
        type        : String
        default     : require 'hat'
      title         :
        type        : String
        required    : yes
      description   : String
      group         :
        type        : String
        required    : yes
      quantities    :
        type        : Object
        default     : -> {}      
      tags          : (require './schema').tags
      sortWeight    : Number
    relationships   :
      product       :
        targetType  : 'JPaymentProduct'
        as          : 'plan product'

  @create = (groupSlug, formData, callback) ->

    { title, description, tags } = formData

    JGroup = require '../group'

    pack = new this {
      title
      description
      tags
      group       : groupSlug
    }

    pack.save (err) ->
      return callback err  if err

      JGroup.one slug: groupSlug, (err, group) ->
        return callback err  if err

        group.addPack pack, (err) ->
          return callback err  if err

          callback null, pack
