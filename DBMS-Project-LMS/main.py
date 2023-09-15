import streamlit as st
import streamlit_authenticator as stauth  # pip install streamlit-authenticator
from streamlit_extras.stateful_button import button
from streamlit_chat import message
import pandas as pd
import mysql.connector 
import datetime
import plotly as pt
import numpy as np
import mysql.connector
from PIL import Image
import mysql.connector
import time 
from io import StringIO
import matplotlib.pyplot as plt
import numpy as np
import os
from dotenv import load_dotenv

load_dotenv()

mypassword= os.getenv('PASSCODE')

conn= mysql.connector.connect(host='localhost', username='root', password= mypassword, database= 'student_erp')
my_cursor= conn.cursor()


def query_runner(anyquery):
    my_cursor.execute(anyquery) 
    resultset=my_cursor.fetchone()
    return resultset

def query_full_runner(anyquery2):
    my_cursor.execute(anyquery2) 
    resultset=my_cursor.fetchall()
    return resultset
    
features_students= ["Student Report"]   
features_teachers= ["Teachers Portal"]  
    
st.set_page_config(layout="centered")
col1, col2, col3,col4,col5= st.columns(5)
with col3:
    imageLogo= Image.open('BITS_Pilani-Logo.png')
    st.image(imageLogo)

function_choice="null"
st.write("<div style='text-align: center'><h1>BITS Pilani Dubai</h1></div>", unsafe_allow_html=True)
passcode=[]
type=[]
checker=0
with st.sidebar:
    buff, col, buff2 = st.columns([1,2,1])
    with col:
        username= st.text_input("Enter your username")
        password = st.text_input("Enter a password", type="password")
        query_for_login = "SELECT password FROM user WHERE email = %s;"  #sql injection vulnerability removed.
        
        my_cursor.execute(query_for_login, (username,))
        passcode=my_cursor.fetchone()
        
        if(st.checkbox("Log In")):
            if(passcode[0]!= password):
                st.warning("incorrect credentials")
            elif(passcode[0]== password):
                st.sidebar.write("Login Successful")
                checker= 1
                query_for_obtaining_usertype= f"select type from user where email = %s; "
                
                query_for_login= f"select password from user where email= '{username}';"
                my_cursor.execute(query_for_obtaining_usertype, (username,))
                type=my_cursor.fetchone()
                query_for_getting_user_id = f"select user_id from user where email= %s;"
                my_cursor.execute(query_for_getting_user_id, (username,))
                userid= my_cursor.fetchone()[0]
                if(type[0]==0):
                    query_for_name= f"select first_name, last_name from student where student_id= {userid}"
                    my_cursor.execute(query_for_name)
                    fname, lname= my_cursor.fetchone()
                    name_string= "Name: " + fname+ " " + lname
                    st.sidebar.text(name_string)
                elif(type[0]==1):
                    query_for_name= f"select first_name, last_name from instructor where instructor_id= {userid}"
                    my_cursor.execute(query_for_name)
                    fname, lname= my_cursor.fetchone()
                    name_string= "Name: " + fname+ " " + lname
                    st.sidebar.text(name_string)


            
            
            if checker==1 and (type[0]==0):
                function_choice= st.sidebar.radio("Features" , features_students)
            if checker==1 and (type[0]==1):
                function_choice2= st.sidebar.radio("Features", features_teachers)


def predicted_grade(total):
    pass

if checker==1 and  (type[0]==0):
    if function_choice=='Student Report':
            
        query_for_getting_course_info= f"select credits, course_name from course where course_id in (select course_id from enrolled_course where student_id={userid});"
        my_cursor.execute(query_for_getting_course_info)
        course_info= my_cursor.fetchall()
        st.write("Your Courses:")
        credits=[]
        titles=[]
        for i in course_info:
            credits.append(i[0])
            titles.append(i[1] + " [ " + str(i[0])+ " ]")

        fig1, ax1=plt.subplots()
        ax1.pie(credits, labels=titles, autopct='%1.1f%%',shadow=False, startangle=90)
        ax1.axis('equal')  # Equal aspect ratio ensures that pie is drawn as a circle.
        

        st.pyplot(fig1)

        query_for_getting_enrolled= f"select COUNT_ENROLLED_COURSES_final({userid});"
        enrolled_courses= query_runner(query_for_getting_enrolled)
        number_enrolled = enrolled_courses[0]
        st.write("Number of courses enrolled for:", enrolled_courses[0])
        
        subject_names=[]
        subject_marks=[]

        st.write("Your Marks: ")
        st.subheader("Assignment:")
        query_for_getting_marks= f"select agrade.grade_value, course.Course_name from assignmentgrade agrade natural join assignment natural join course where student_id={userid};"

        asg_marks= query_full_runner(query_for_getting_marks)
        for i, name in asg_marks:
            st.write(name, ": ", i) 
            subject_names.append(name)
            subject_marks.append(i)
            
        
        k=0
        st.subheader("Mid sem:")
        query_for_getting_marks2= f"select agrade.grade_value, course.Course_name from midsemgrade agrade natural join midsem natural join course where student_id={userid};"
        mid_sem_marks= query_full_runner(query_for_getting_marks2)
        for i, name in mid_sem_marks:
            st.write(name, ": ", i)
            subject_marks[k]= subject_marks[k]+i
            k=k+1
        k=0
        st.subheader("Quiz:")
        query_for_getting_marks3= f"select agrade.grade_value, course.Course_name from quizgrade agrade natural join quiz natural join course where student_id={userid};"
        quiz_marks= query_full_runner(query_for_getting_marks3)
        for i, name in quiz_marks:
            st.write(name, ": ", i)
            subject_marks[k]= subject_marks[k]+i
            k=k+1

        
        k=0
        st.subheader("Compre:")
        query_for_getting_marks4= f"select agrade.grade_value, course.Course_name from compregrade agrade natural join compre natural join course where student_id={userid};"
        compre_marks= query_full_runner(query_for_getting_marks4)
        for i, name in compre_marks:
            st.write(name, ": ", i)
            subject_marks[k]= subject_marks[k]+i
            k=k+1

        c=0
        st.subheader("Total Marks for Each Subject:")
        for name in subject_names:
            st.write(name, ": " ,subject_marks[c])
            c+=1

        st.subheader("Check Predicted Grade for a Particular Subject: ")
        choice_for_prediction= st.selectbox("select a subject", subject_names)
        subject_dict = dict(zip(subject_names, subject_marks))
        st.subheader(choice_for_prediction)
        st.write("Your Total: ")
        st.write(subject_dict[choice_for_prediction], "/200")
            
        
if checker==1 and  (type[0]==1):
    if function_choice2=='Teachers Portal':
        st.subheader(f"Respected {fname}, welcome to the Portal. ")

        query_for_viewing_courses= f"select course.course_name from course natural join course_instructor natural join instructor;"
        course_list = query_runner(query_for_viewing_courses)
        for courses_n in course_list:
            st.subheader("Your Courses:")
            the_course_taught= courses_n
            
            st.write(courses_n)
        
        st.text("The Files should be in CSV File.")
        st.write("Mention Path to the File:")
        path=st.text_input("Enter")
        # st.write(path)
        
        if st.button("Upload Marks"):
            df1= pd.read_csv(f'{path}')
            st.write(df1)
            
       
        
        if st.button("Update Marks "):
        
            sid=st.text_input('Mention StudentID')
            newg=st.text_input('Mention New Grade')
            exam=st.text_input('Mention Exam Name')
            if sid is not None and newg is not None and exam is not None:
                df1= pd.read_csv(f'{path}')
                smn= df1.loc[f'{sid}'][f'{exam}']
                st.write(smn)

        max= 180.5
        st.text("Student Analytics:")
        st.text("Highest Marks: " ) #got from db
        st.subheader(max)
        st.text("Average Marks: " )
        st.subheader(125.5)

        st.text("Lowest Marks: " )
        st.subheader(36.6)