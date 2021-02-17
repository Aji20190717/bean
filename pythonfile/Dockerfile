FROM python 
COPY ./ app 
WORKDIR /app 

RUN pip install Flask 
RUN pip install requests
RUN pip install numpy
RUN pip install matplotlib
RUN pip install opencv-python

EXPOSE 5000
CMD ["python", "ocr_kakao_preprocessing"]
