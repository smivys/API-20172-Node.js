var express = require('express');
var mysql = require('mysql');
var app = express();
var bodyParser = require('body-parser');
app.use(bodyParser.urlencoded({ extended: true}));
app.use(bodyParser.json());
var port = process.env.PORT || 8082;
var jwt = require('jsonwebtoken');
var config = require ('./config');
var user =  require ('./user');
app.set('superSecret', config.secret);
var apiRoutes = express.Router(); 
var conn = mysql.createPool({
    host:"localhost", user:"root",
    password: null, database:"dbapi",
});

app.post("/login", function(req,res){
    
    if(!req.body.phonenumber||!req.body.password){
        return res.json({report:report9995});
    } else {
        var username = req.body.username;
        var password = req.body.password;
    }
    var payload = {id: req.body.username};
    var token = jwt.sign(payload, app.get('superSecret'));
    var sql = ("Select * from users where phonenumber = ?");
    conn.query(sql, [req.body.phonenumber], function(err,result){
        if (err) {
            return res.json({
                report:report1001
            });
         } else {
            return res.json({
                report:report1000,
                data:result,
                token: token
            });   
        }
    });
});  
app.post('/signup', function (req, res) {
    if(!req.body.phonenumber||!req.body.password||!req.body.username){
        return res.json({report:report9995});
    }
        var sql = ("INSERT INTO users (username, phonenumber, password) VALUES (?,?,?)");
        conn.query(sql, [req.body.username, req.body.phonenumber, req.body.password], function (err, data) {
            if (err){ return res.json({
                report: report1001
            });
        } else {
        res.json({
            report:report1000
        });}
    });
});
app.post("/get_user_info", function(req, res){
    var sql = ("Select users.phonenumber, users.username from users where users.id = ?");
    if(!req.body.token){
        return res.json({
            report: report9998
        });
    }else{
    conn.query(sql, [req.body.id], function(err,result){
        if (err) {
           return res.json({
               report:report1001
           });
        } else {
           return res.json({
               report:report1000,
               data:result,
               token: req.body.token
           });   
       }
    });}
});
app.post("/save_search", function (req, res){
    if(!req.body.token){
        return res.json({
            report: report9998
        });
    }
    var sql = ("INSERT INTO savedsearch (keyword, category_id, brand_id, product_size_id, price_min, price_max, condition) VALUES (?,?,?,?,?,?,?)");
    if (!req.body.keyword && !req.body.category_id &&
         !req.body.brand_id && !req.body.product_size_id &&
          !req.body.price_min && !req.body.price_max &&
           !req.body.condition) {
        return res.json({
            report:report9994,
            token:  req.body.token
        }); 
    } else {
            conn.query(sql,[req.body.keyword, req.body.category_id, req.body.brand_id, req.body.product_size_id, req.body.price_min, req.body.price_max, req.body.condition], function(err, result){
                if (err) {
                    return res.json({
                        report:report1001
                    });
                } else {
                    return res.json({
                        report:report1000,
                        data: result
                     });
                }
            });
            
        }
});
app.post("/like_products", function (req, res){
    if(!req.body.token){
        return res.json({
            report: report9998
        });
    }
    var sql = ("UPDATE products SET products.is_liked = 1 WHERE products.id = ?");
    conn.query(sql, [req.body.id] , function(err, result){
        if (err) {
            return res.json({
                report:report1001,
                token: req.body.token
            });
        } else {
            return res.json({
                report:report1000,
                data: result
            });
        }
    });
});
app.post("/del_products", function (req, res){
    if(!req.body.token){
        return res.json({
            report: report9998
        });
    }
    var sql = ("DELETE FROM products WHERE products.id = ?");
    conn.query(sql,[req.body.id] , function (err, result){
        if (err) {
            return res.json({
                report:report1001,
                token: req.body.token
            });
        } else {
            return res.json({
                report:report1000
            });
        }
    });
});
app.post("/report_products", function(req, res){
    if(!req.body.token){
        return res.json({
            report: report9998
        });
    }
    var sql = ("INSERT INTO products(subject, details) VALUES (?,?)");
    conn.query(sql,[req.body.subject, req.body.details] , function (err, result){
        if (err) {
            return res.json({
                report:report1001,
                token: req.body.token
            });
        } else {
            return res.json({
                report:report1000,
                data: result
            });
        }
    });
});
app.post("/delete_order_address", function (req, res){
    if(!req.body.token){
        return res.json({
            report: report9998
        });
    }
    var sql = ("DELETE orders.address FROM orders WHERE orders.id = ?");
    conn.query(sql,[req.body.orders_id], function(err, result){
        if (err) {
            return res.json({
                report:report1001,
                token: req.body.token
            });
        } else {
            return res.json({
                report:report1000
            });
        }
    });
});
app.post("/delete_saved_search", function(req, res){
    if(!req.body.token){
        return res.json({
            report: report9998
        });
    }
    var sql = ("DELETE FROM savedsearch WHERE savedsearch.search_id = ?");
    conn.query(sql,[req.body.search_id], function(err, result){
        if (err) {
            return res.json({
                report:report1001,
                token: req.body.token
            });
        } else {
            return res.json({
                report:report1000
            });
        }
    });
});
app.post("/search", function (req, res){
    if(!req.body.token){
        return res.json({
            report: report9998
        });
    }
    var sql = (" Select products.* FROM savedsearch, products LIMIT ?, ? ");
    if (!req.body.keyword && !req.body.category_id &&
         !req.body.brand_id && !req.body.product_size_id &&
          !req.body.price_min && !req.body.price_max &&
           !req.body.condition && !req.body.index && !req.body.count) {
        return res.json({
            report:report9994,
            token:  req.body.token
        }); 
    } else {
            conn.query(sql, [req.body.index, req.body.count], function(err, result){
                if (err) {
                    return res.json({
                        report:report1001
                    });
                } else {
                    return res.json({
                        report:report1000,
                        data: result
                     });
                }
            });
            
        }
});
app.post("/get_products", function(req, res){
    if(!req.body.token){
        return res.json({
            report: report9998
        });
    }
    var sql = ('SELECT products.* FROM products WHERE products.id = ?');
    conn.query(sql, [req.body.id], function(err, result){
        if (err) {
            return res.json({
                report:report1001,
                token: req.body.token
            });
        } else {
            return res.json({
                report:report1000,
                data: result
            });
        }
    });
});
app.post("/get_comment_products", function(req, res){
    var sql = ("Select COUNT(comment_products.comment),comment_products.* FROM comment_products WHERE comment_products.id = ?");
    conn.query(sql, [req.body.id], function(err, result){
        if (err) {
            return res.json({
                report:report1001
            });
        } else {
            return res.json({
                report:report1000,
                data: result
             });
        }
    });
});
app.post("/get_my_likes", function(req, res){
    if(!req.body.token){
        return res.json({
            report: report9998
        });
    }
    var sql = ("Select products.id, products.name, products.price, products.image, products.is_sold FROM products WHERE products.is_liked = 1 LIMIT ?,?");
    conn.query(sql, [req.body.index, req.body.count], function(err, result){
        if (err) {
            return res.json({
                report:report1001
            });
        } else {
            return res.json({
                report:report1000,
                data: result
             });
        }
    });
});
app.post("/set_user_info", function(req, res){
    if(!req.body.token){
        return res.json({
            report: report9998
        });
    }
    var sql = ("INSERT INTO users (email, username, status, avatar, firstname, lastname, address, city, password) VALUES (?,?,?,?,?,?,?,?,?)");
    conn.query(sql,[req.body.email, req.body.username, req.body.status, req.body.avatar, req.body.firstname, req.body.lastname, req.body.address, req.body.city, req.body.password],
         function(err, result){
        if (err) {
            return res.json({
                report:report1001
            });
        } else {
            return res.json({
                report:report1000,
                data: req.body.avatar
             });
        } 
    });
});
app.post("/get_list_brand", function(req, res){
    var sql = ("Select brand.* from brand where brand.category_id = ?");
    var sql1 = ("Select brand.* from brand ");
    if (!req.body.category_id){
        conn.query(sql1, function(err, result){
            if (err){
                return res.json({
                    report:report1001
                });
            } else {
                return res.json({
                    report:report1000,
                    data: result
                });
            }
        });
    } else {
        conn.query(sql, [req.body.category_id], function(err, result){
            if (err){
                return res.json({
                    report:report1001
                });
            } else {
                return res.json({
                    report:report1000,
                    data: result
                });
            }
        });
    }
});
app.post("/get_list_sizes", function(req, res){
    var sql = ("Select size.* from size where size.category_id = ?");
    var sql1 = ("Select size.* from size ");
    if (!req.body.category_id){
        conn.query(sql1, function(err, result){
            if (err){
                return res.json({
                    report:report1001
                });
            } else {
                return res.json({
                    report:report1000,
                    data: result
                });
            }
        });
    } else {
        conn.query(sql, [req.body.category_id], function(err, result){
            if (err){
                return res.json({
                    report:report1001
                });
            } else {
                return res.json({
                    report:report1000,
                    data: result
                });
            }
        });
    }
});
app.post("/set_read_message", function(req,res){
    if(!req.body.token){
        return res.json({
            report: report9998
        });
    }
    var sql = ('INSERT INTO message (read_message) VALUES (1) WHERE message.partner_id = ? AND message.product_id = ?');
    if (!req.body.partner_id || !req.body.product_id){
        return res.json({
            report: report1004
        });
    } else {
        conn.query(sql, [req.body.partner_id, req.body.product_id], function(err, result){
            if(err){
                return res.json({
                    report:report1001
                });
            } else {
                return res.json({
                    report:report1000
                });
            }
        });
    }
});
app.post("/get_list_saved_search", function(req, res){
    if(!req.body.token){
        return res.json({
            report: report9998
        });
    }
    var sql = ('Select * from savedsearch order by savedsearch.id desc LIMIT ?, ? ');
    conn.query(sql, [req.body.index, req.body.count], function(err, result){
        if(!req.body.index || !req.body.count){
            return res.json({
                report:report1004
            });
        } else if(err){
            return res.json({
                report:report1001
            });
        } else {
            return res.json({
                report:report1000
            });
        }
    });
});
app.post("/edit_product", function(req, res){
    if(!req.body.token){
        return res.json({
            report: report9998
        });
    }
    var sql = ('INSERT INTO products(name, price, described, product_size_id, brand_id, category_id, ships_from, ships_from_id, condition, image, image_del, video, thumb, dimension, weight) WHERE products.id = ? VALUES ?,?,?,?,?,?,?,?,?,?,?,?,?,?,? ');
    if(!req.body.id){
        return res.json({
            report:report1004
        });
    } else if(!req.body.name||!req.body.price||!req.body.described||!req.body.product_size_id||!req.body.brand_id||!req.body.category_id||!req.body.ships_from||!req.body.ships_from_id||!req.body.condition||!req.body.image||!req.body.image_del||!req.body.video||!req.body.thumb||!req.body.dimension||!req.body.weight){
                return res.json({
                    report:report1002
                });
            } else {
                conn.query(sql, [req.body.name, req.body.price, req.body.described, req.body.product_size_id,
                        req.body.brand_id, req.body.category_id, req.body.ships_from, req.body.ships_from_id,
                        req.body.condition, req.body.image, req.body.image_del, req.body.video, req.body.thumb,
                        req.body.dimension, req.body.weight], function(err){
                            if(err){
                                return res.json({
                                    report:report1001
                                });
                            } else {
                                return res.json({
                                    report:report1000
                                });
                            }
                    });
            }
});
app.post("/add_product", function(res,req){
    if(!req.body.token){
        return res.json({
            report: report9998
        });
    }
    var sql = ('INSERT INTO products(name, price, described, product_size_id, brand_id, category_id, ships_from, ships_from_id, condition, image, image_del, video, thumb, dimension, weight) VALUES ?,?,?,?,?,?,?,?,?,?,?,?,?,?,? ');
    var sql1 = ('Select products.id, products.url from products order by id desc LIMIT 1');
    if(!req.body.name||!req.body.price||!req.body.described||!req.body.product_size_id||!req.body.brand_id||!req.body.category_id||!req.body.ships_from||!req.body.ships_from_id||!req.body.condition||!req.body.image||!req.body.image_del||!req.body.video||!req.body.thumb||!req.body.dimension||!req.body.weight){
        return res.json({
            report:report1002
        });
    } else {
        conn.query(sql, [req.body.name, req.body.price, req.body.described, req.body.product_size_id,
                req.body.brand_id, req.body.category_id, req.body.ships_from, req.body.ships_from_id,
                req.body.condition, req.body.image, req.body.image_del, req.body.video, req.body.thumb,
                req.body.dimension, req.body.weight], function(err){
                    if(err){
                        return res.json({
                            report:report1002
                        });
                    } else {
                        conn.query(sql1, function(err, result){
                            if(err){
                                return res.json({
                                    report:report1001
                                });
                            } else {
                                return res.json({
                                    report:report1000,
                                    data: result
                                });
                            }
                        });
                    }
            });
    }
}); 
app.post("/set_user_setting", function(req, res){
    if(!req.body.token){
        return res.json({
            report: report9998
        });
    }
    var sql =('INSERT INTO user_setting (auto_withdraw, vacation_mode) VALUES ?,?');
    if(!req.body.auto_withdraw || !req.body.vacation_mode){
        return res.json({
            report: report1004
        });
    } else if(req.body.auto_withdraw != 1 && req.body.auto_withdraw != 0 ){
        return res.json({
            report: report1003
        });
    } else{
        conn.query(sql, [req.body.auto_withdraw, req.body.vacation_mode], function(err){
            if(err){
                return res.json({
                    report:report1001
                });
            } else {
                return res.json({
                    report:report1000,
                    data: result
                });
            }
        });
    }
});
app.post("/get_user_setting", function(req, res){
    if(!req.body.token){
        return res.json({
            report: report9998
        });
    }
    var sql = ('select * from user_setting');    
    conn.query(sql, function(err, result){
        if(err){
            return res.json({
                report:report1001
            });
        } else {
            return res.json({
                report:report1000,
                data: result
            });
        }
    });
});
app.post("/get_list_order_address", function(req, res){
    if(!req.body.token){
        return res.json({
            report: report9998
        });
    }
    var sql = ('select * from orders');
    conn.query(sql, function(err, result){
        if(err){
            return res.json({
                report:report1001
            });
        } else {
            return res.json({
                report:report1000,
                data: result
            });
        }
    });
});
app.post("/add_order_address", function(req, res){
    if(!req.body.token){
        return res.json({
            report: report9998
        });
    }
    var sql =('insert into orders (address, address_id, default_address) values ?,?,?');
    if(!req.body.address||!req.body.address_id||!req.body.default){
        return res.json({
            report: report1004
        });
    } else {
        conn.query(sql, [req.body.address,req.body.address_id, req.body.default], function(err, result){
            if(err){
                return res.json({
                    report:report1001
                });
            } else {
                return res.json({
                    report:report1000,
                    data: result
                });
            }
        }); 
    }
});
app.post("/set_push_setting", function(req, res){
    var sql = ('select * from user_setting');
    if(!req.body.token){
        return res.json({
            report: report9998
        });
    } else {
        conn.query(sql, function(err, result){
            if(err){
                return res.json({
                    report: report1001
                });
            } else{
                return res.json({
                    report: report1000,
                    data: result
                });
            }
        });
       
    }
});
app.post("/edit_order_address", function(req, res){
    var sql = ('UPDATE orders SET orders.address = ? WHERE address_id = ?'); //edit row not insert
    if(!req.body.token){
        return res.json({
            report: report9998
        });
    } else {
        conn.query(sql, [req.body.address, req.body.address_id], function(err){
            if(err){
                return res.json({
                    report: report1001
                });
            } else{
                return res.json({
                    report: report1000
                });
            }
        });
       
    }
});
app.post("/set_comment_product", function(req, res){
    var sql = ('INSERT INTO comment_product (comment) VALUES (?) WHERE comment.id_products = ? LIMIT ?,? ');// index =  chi so cmt bat dau, count = so luong cmt lay ve
    if(!req.body.token){
        return res.json({
            report: report9998
        });
    } else {
        conn.query(sql, [req.body.comment, req.body.product_id, req.body.index, req.body.count], function(err, result){
            if(err){
                return res.json({
                    report: report1001
                });
            } else{
                return res.json({
                    report: report1000,
                    data: result
                });
            }
        });
       
    }
});
app.post("/get_list_product", function(req, res){
    var sql = ('select * from products limit ?,? ');
    var sql1 = ('select products.id from products DESC LIMIT 1');
    conn.query(sql1, function(err, result1){
        if(err){
            return res.json({
                report: report1001
            }); 
        }
    });
    conn.query(sql, [req.body.index, req.body.count], function(err, result){
        if(err){
            return res.json({
                report: report1001
            });
        } else{
            return res.json({
                report: report1000,
                data: result, 
                last_id: result1
            });
        }
    });
});
app.post("/set_read_notification", function(req, res){
    var sql =('UPDATE notifications SET notifications.read = 1 WHERE notifications_id =?; SELECT COUNT(notifications.read) WHERE notifications.read = 0');
    if(!req.body.token){
        return res.json({
            report: report9998
        });
    } else {
        conn.query(sql, [req.body.id], function(err, result){
            if(err){
                return res.json({
                    report: report1001
                });
            } else{
                return res.json({
                    report: report1000,
                    data: result
                });
            }
        });
    }
});
app.post("/get_read_notification", function(req, res){
    var sql = ('select * from notifications');
    if(!req.body.token){
        return res.json({
            report: report9998
        });
    } else {
        conn.query(sql, [req.body.index, req.body.count], function(err, result){
            if(err){
                return res.json({
                    report: report1001
                });
            } else{
                return res.json({
                    report: report1000,
                    data: result
                });
            }
        });
    }
});
app.post("/get_ship_from", function(req, res){
    var sql = ('select * from ship_from where ship_from.level = ? LIMIT ?,?');
    conn.query(sql, [req.body.level, req.body.index, req.body.count], function(err, result){
        if(err){
            return res.json({
                report: report1001
            });
        } else {
            return res.json({
                report: report1000,
                data: result
            });
        }
    });
});
app.post("/get_notification", function(req, res){
    var sql = ('select * from notifications');
    if(!req.body.token){
        return res.json({
            report: report9998
        });
    } 
    conn.query(sql, function(err, result){
        if(err){
            return res.json({
                report: report1001
            });
        } else {
            return res.json({
                report: report1000,
                data: result
            });
        }
    });
}); 
report1001 = {"code":"1001", "message":"Cannot connect to database"};
report1000 = {"code":"1000", "message":"OK!"};
report9991 = {"code":"9991", "message":"Spam"};
report9992 = {"code":"9992", "message":"Product is not existed"};
report9993 = {"code":"9993", "message":"Code verify is in correct"};
report9994 = {"code":"9994", "message":"No data or end of list data"};
report9995 = {"code":"9995", "message":"User is not validated"};
report9996 = {"code":"9996", "message":"User existed"};
report9997 = {"code":"9997", "message":"Method is invalid"};
report9998 = {"code":"9998", "message":"Token is invalid"};
report9999 = {"code":"9999", "message":"Exception error"};
report1002 = {"code":"1002", "message":"Parameter is not enough"};
report1003 = {"code":"1003", "message":"Parameter type is invalid"};
report1004 = {"code":"1004", "message":"Parameter value is invalid"};
report1005 = {"code":"1005", "message":"Unknow error"};
report1006 = {"code":"1006", "message":"File size is too big"};
report1007 = {"code":"1007", "message":"Upload file failed"};
report1008 = {"code":"1008", "message":"Maximum number of images"};
report1009 = {"code":"1009", "message":"Not access"};
report1010 = {"code":"1010", "message":"Action has been done previously by this user"};
report1011 = {"code":"1011", "message":"The product has been sold"};
report1012 = {"code":"1012", "message":"Address does not support Shipping"};
report1013 = {"code":"1013", "message":"Url User\'s is exist"};
report1014 = {"code":"1014", "message":"Promotional code expired"};
app.listen(port);
console.log("server is listening");


