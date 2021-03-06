FROM golang:alpine                                                                                                                                     
ENV DEBIAN_FRONTEND=noninteractive    
LABEL maintainer="x25 aka oski02"                                                                                                                                 
                                                                                                                                                       
RUN apk add --no-cache bash-completion                                                                                                                 
RUN apk add --no-cache jq                                                                                                                              
RUN apk add --no-cache git                                                                                                                             
RUN apk add --no-cache bash                                                                                                                            
RUN apk add --no-cache nano                                                                                                                            
RUN apk add --no-cache wget                                                                                                                            
RUN apk add --no-cache unzip                                                                                                                           
RUN apk add --no-cache curl                                                                                                                            
RUN apk add --no-cache py3-pip                                                                                                                         
RUN apk add --no-cache gcc                                                                                                                             
RUN apk add --no-cache py3-cryptography                                                                                                                
RUN apk add --no-cache py3-setuptools                                                                                                                  
RUN apk add --no-cache py2-setuptools 
RUN apk add --no-cache vim
                                                                                                                                                       
                                                                                                                                                       
RUN go get -u github.com/tomnomnom/assetfinder                                                                                                         
RUN go get -u github.com/tomnomnom/httprobe                                                                                                            
RUN go get github.com/tomnomnom/waybackurls                                                                                                            
RUN go get -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder                                                                                   
RUN go get -v github.com/projectdiscovery/httpx/cmd/httpx                                                                                              
RUN go get github.com/ffuf/ffuf                                                                                                                        
RUN go get -u github.com/tomnomnom/fff                                                                                                                 
RUN go get -u github.com/tomnomnom/unfurl                                                                                                              
RUN go get -u github.com/lc/subjs                                                                                                                      
RUN GO111MODULE=on go get -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei                                                                          
RUN go get github.com/Emoe/kxss                                                                                                                        
RUN go get -v github.com/hahwul/dalfox/v2                                                                                                              
RUN go get -u github.com/tomnomnom/gf                                                                                                                  
RUN go get -u -v github.com/lc/gau                                                                                                                     
RUN GO111MODULE=on go get -u github.com/jaeles-project/gospider                                                                                        
RUN go get -v github.com/OWASP/Amass/v3/...   
RUN go get -u github.com/tomnomnom/meg                                                                                                                 
RUN go get software.sslmate.com/src/certspotter/cmd/certspotter                                                                                        
RUN go get -u github.com/tomnomnom/anew    
RUN go install github.com/OJ/gobuster/v3@latest
RUN GO111MODULE=on go get -v github.com/projectdiscovery/dnsx/cmd/dnsx



                                                                                                                                                                                             
WORKDIR /go/bin                                                                                                                                        
RUN cd /go/bin                                                                                                                                         
                                                                                                                                                       
                                                                                                                                                       
RUN wget --quiet https://raw.githubusercontent.com/oski02/bugDockbounty/main/.bashrc -O ~/.bashrc                             
RUN wget --quiet https://github.com/Edu4rdSHL/findomain/releases/download/1.5.0/findomain-linux -O findomain;chmod +x findomain
RUN wget --quiet https://github.com/michenriksen/aquatone/releases/download/v1.7.0/aquatone_linux_amd64_1.7.0.zip -O aquatone.zip && \
    unzip aquatone.zip && rm aquatone.zip 
RUN wget --quiet https://github.com/maurosoria/dirsearch/archive/master.zip -O dirsearch.zip && unzip dirsearch.zip  && rm dirsearch.zip && \
    mv dirsearch-master dirsearch && pip3 install -r dirsearch/requirements.txt && python3 dirsearch/setup.py install
RUN git clone https://github.com/bonino97/new-zile.git && pip3 install termcolor 
RUN git clone https://github.com/GerbenJavado/LinkFinder.git && pip3 install -r LinkFinder/requirements.txt; python3 LinkFinder/setup.py install; \
    pip install -r LinkFinder/requirements.txt; python LinkFinder/setup.py install
RUN git clone --depth 1 https://github.com/sqlmapproject/sqlmap.git sqlmap
RUN git clone https://github.com/tomnomnom/meg.git meg1
RUN git clone https://github.com/tomnomnom/gf.git gf1; mkdir ~/.gf ; cp -r gf1/examples/* ~/.gf/
RUN git clone https://github.com/devanshbatham/ParamSpider && pip3 install -r ParamSpider/requirements.txt ; cp -r ParamSpider/gf_profiles/* ~/.gf/


RUN ln -s /go/bin/dalfox /usr/bin/dalfox; \
    ln -s /go/bin/ffuf   /usr/bin/ffuf; \
    ln -s /go/bin/fff    /usr/bin/fff; \
    ln -s /go/bin/aquatone /usr/bin/aquatone; \
    ln -s /go/bin/assetfinder /usr/bin/assetfinder; \
    ln -s /go/bin/findomain /usr/bin/findomain; \ 
    ln -s /go/bin/amass /usr/bin/amass; \
    ln -s /go/bin/gau /usr/bin/gau; \
    ln -s /go/bin/subfinder /usr/bin/subfinder; \
    ln -s /go/bin/dirsearch/dirsearch.py /usr/bin/dirsearch.py; \
    ln -s /go/bin/gospider /usr/bin/gospider; \
    ln -s /go/bin/sqlmap-dev/sqlmap.py /usr/bin/sqlmap.py; \
    ln -s /go/bin/meg /usr/bin/meg; \
    ln -s /go/bin/certspotter /usr/bin/certspotter; \
    ln -s /go/bin/anew /usr/bin/anew
RUN rm /go/bin/README.md /go/bin/LICENSE.txt
RUN git clone https://github.com/danielmiessler/SecLists.git
RUN ln -s /go/bin/ ~/tools


RUN bash
CMD "/bin/bash"
