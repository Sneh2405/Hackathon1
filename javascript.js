document.addEventListener('DOMContentLoaded', function() {
    const courseList = document.getElementById('course-list');
    const courseTitle = document.getElementById('course-title');
    const courseDescription = document.getElementById('course-description');
    const courseVideo = document.getElementById('course-video');

    const courses = {
        course1: {
            title: "Course 1: Introduction to Programming",
            description: "Learn the basics of programming with this introductory course. Perfect for beginners.",
            video: "https://www.youtube.com/embed/zOjov-2OZ0E"
        },
        course2: {
            title: "Course 2: CSS",
            description: "Dive deep into data science with advanced techniques and real-world projects.",
            video: "https://www.youtube.com/embed/4nC4VXHlys8"
        },
        course3: {
            title: "Course 3: HTML,CSS,JS",
            description: "Explore modern marketing strategies and learn how to apply them in today's market.",
            video: "https://www.youtube.com/embed/2Yk7wNfuUug"
        }
    };

    courseList.addEventListener('change', function() {
        const selectedCourse = courseList.value;
        if (courses[selectedCourse]) {
            courseTitle.textContent = courses[selectedCourse].title;
            courseDescription.textContent = courses[selectedCourse].description;
            courseVideo.src = courses[selectedCourse].video;
        } else {
            courseTitle.textContent = '';
            courseDescription.textContent = '';
            courseVideo.src = '';
        }
    });
});