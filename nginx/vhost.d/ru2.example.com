location / {
    proxy_pass ${UPSTREAM};
    proxy_ssl_server_name on;
    proxy_set_header Host example.com;
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header X-Forwarded-Proto $scheme;
}
