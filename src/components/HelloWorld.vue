<template>
  <div>
    <div class="vid-cont">
      <video controls :src="videoFile"></video>
    </div>
    <button @click="handleClick">
      Select video
    </button>
  </div>
</template>

<script setup>
import { ref } from 'vue';
import { dialog } from '@electron/remote';

const videoFile = ref("")
  const count = ref(0);
 
  const handleClick = async ()=>{
    const selectedFile  = await dialog.showOpenDialog({ properties: ['openFile'],
      filters: [{
        name: "Video files",
        extensions: ["mp4", "avi", "webm"]
      }]
     });

     if (selectedFile.filePaths.length){
      videoFile.value =  selectedFile.filePaths[0]
     }
     

  }
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="scss">
h3 {
  margin: 40px 0 0;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  color: #42b983;
}

.vid-cont{
  background-color: black;
  width: calc(100vw - 20px);
  height: 55vh;
  margin-bottom: 10px;
  video{
    width: 100%;
    height: 100%;
  }

}
</style>
