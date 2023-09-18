<template>
    <div class="p-2 body">
      <TMeta :title="`Contact us - ${SITE}`" :url="ROOT + '/contact'" />
      <fieldset class="p-3 br-10 form bg-blue-2 formset border-card">
        <legend class="">Contact us</legend>
        <form action="#" @submit="contactUs">
          <div class="form-group">
            <label for="fullname">Full name:</label>
            <input
              required
              name="name"
              id="fullname"
              type="text"
              class="form-control"
              placeholder="Enter your full name..."
            />
          </div>
          <div class="form-group">
            <label for="email">Email address:</label>
            <input
              reuired
              name="email"
              id="email"
              type="email"
              placeholder="Enter your Email address..."
              class="form-control"
            />
          </div>
          <div class="form-group">
            <label for="msg">Message:</label>
            <textarea placeholder="What is your query?..." required name="message" id="msg" class="form-control" />
          </div>
          <div class="form-group mt-4 mb-3">
            <button class="btn bg-dark-0 m-auto w-100p border-body" type="submit">
              Submit
            </button>
          </div>
        </form>
        <p class="t-c">
          Or email us at:
          <a :href="`mailto:${EMAIL}`" class="link">
            {{EMAIL}}</a
          >
        </p>
      </fieldset>
    </div>
  </template>

  <script setup lang="ts">
  import {ROOT, SITE, EMAIL} from '@/utils/constants';
import $ from "jquery"

function contactUs(e: any) {
      e.preventDefault();

      const form = e.currentTarget;
      const btn = $(form.querySelector("button"));
      const { name, email, message } = form;

      const fd = new FormData();
      fd.append("name", name.value);
      fd.append("email", email.value);
      fd.append("message", message.value);
      $(".inProgress").show();
      btn.text("Sending message...");
      btn[0].disabled = true

    }
</script>