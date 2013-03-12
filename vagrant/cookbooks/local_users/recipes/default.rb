#
# Cookbook Name:: local_users
# Recipe:: default
#
# Copyright 2012, Koding
#
# All rights reserved - Do Not Redistribute
#

package "libshadow-ruby1.8" do
  action :install
end

# bahadir  cthorn  dyasar  ec2-user  ggoksel  ri
local_users_prod = {
                   "bahadir" => { "id" => 607, "pass" => "$1$lkG1zSHa$DkkXZsCYYX0i8jv2NhkJl.", "sshkey" => true},
                   "chris"  => { "id" => 602, "pass" => "$1$PSbDpLs/$Y1uyQci7JEkLvvoQ9dnMB1", "sshkey" => true},
                   "dyasar"  => { "id" => 601, "pass" => "$1$B4tVUcrC$rUeL1FMDHKBZ41c4w1yj4.", "sshkey" => true},
                   "gokmen" => { "id" => 606, "pass" => "$1$8xu2mplx$S8QqBws9V7nctl4u1ouMc/", "sshkey" => true},
                   "richard" => { "id" => 605, "pass" => "$1$O.JwAzmg$0ONO0g4t8SE1gOipz0Woh.", "sshkey" => true},
                   "senthil" => { "id" => 605, "pass" => "$1$O.JwAzmg$0ONO0g4t8SE1gOipz0Woh.", "sshkey" => true},
                   "fatihacet" => { "id" => 605, "pass" => "$1$O.JwAzmg$0ONO0g4t8SE1gOipz0Woh.", "sshkey" => true},
                   "cblum"   => { "id" => 666, "pass" => "$6$A9k6e/lC$Y59fsZYIV8iMLPkG9l.SuC8qwBMpQUFq4lMfAjKPQDcJ2dPw8nwrW1IsSNeDNYNMB/zOXgpPZjeK6fgvMt/Bn0", "sshkey" => true},
                 }
                
local_users_dev = {
                   "amykhailov" => { "id" => 600, "pass" => "$1$O.JwAzmg$0ONO0g4t8SE1gOipz0Woh.", "sshkey" => true},
                   "cblum"   => { "id" => 666, "pass" => "$6$A9k6e/lC$Y59fsZYIV8iMLPkG9l.SuC8qwBMpQUFq4lMfAjKPQDcJ2dPw8nwrW1IsSNeDNYNMB/zOXgpPZjeK6fgvMt/Bn0", "sshkey" => true},
                 }
 
case node.chef_environment 
when "prod"
    useradd do
        users local_users_prod
    end
when "dev"
    useradd do
        users local_users_dev
    end
else
    useradd do
        users local_users_prod
    end
end

