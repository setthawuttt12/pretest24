<template>
    <v-container>
        <v-row justify="center">
            <v-col cols="12" md="12">
                <v-card>
                    <v-card-title>
                        <h1 class="text-center text-h5">สำรองข้อมูล</h1>
                    </v-card-title>
                    <v-card-text>
                        <div class="d-flex align-center">
                            <p class="text-body-2">เลือกตารางที่ต้องการ</p>
                            <v-btn variant="tonal" class="ms-2" @click="reload()" color="primary">โหลดรายชื่อตารางใหม่</v-btn>
                        </div>
                        <v-alert v-if="error" class="mt-4" type="error" variant="tonal">{{ error }}</v-alert>
                        <template>
                            <p>ตารางทั้งหมด: {{ tables.length }} | เลือกแล้ว {{ select.length }}</p>
                            <v-btn variant="text" color=""></v-btn>
                        </template>
                    </v-card-text>
                </v-card>
            </v-col>
        </v-row>
    </v-container>
</template>

<script setup lang="ts">

</script>

<style scoped>

</style>