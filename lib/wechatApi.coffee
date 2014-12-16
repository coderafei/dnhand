wechatApi = require('wechat-api')
OAuth = require('wechat-oauth')
config = require '../config'

api = new wechatApi(config.wechat.appid, config.wechat.secret)
api.canThis = config.wechat.canThis

api.oauthApi = new OAuth(config.wechat.appid, config.wechat.secret)

menu = '{
  "button":[
    {
      "type":"click",
      "name":"逢考",
      "key": "other"
    },
    {
      "name":"必",
      "sub_button":[
        {
          "type":"view",
          "name":"绑定",
          "url":"https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx3ff5c48ba9ac6552&redirect_uri=http://n.feit.me/wx/oauth&response_type=code&scope=snsapi_base&state=bind#wechat_redirect"
        },
        {
          "type":"click",
          "name":"考试查询",
          "key":"exam"
        }
      ]
    },
    {
      "name":"过",
      "sub_button":[
        {
          "type":"click",
          "name":"上学期成绩",
          "key":"nowgrade"
        },
        {
          "type":"click",
          "name":"全部成绩",
          "key":"allgrade"
        },
        {
          "type":"click",
          "name":"不及格成绩",
          "key":"bjggrade"
        },
        {
          "type":"click",
          "name":"今天课表",
          "key":"todaysyllabus"
        },
        {
          "type":"click",
          "name":"全部课表",
          "key":"allsyllabus"
        }]
      }
  ]
}'
###
if process.env.NODE_ENV is 'production'
  api.createMenu menu, (err, ret) ->
    console.log  err || "dnhand menu ok msg from wechat: #{ret.errmsg}"
###
module.exports = api
