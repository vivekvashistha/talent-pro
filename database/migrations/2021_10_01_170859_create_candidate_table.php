<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCandidateTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('candidates', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('user_id');
            $table->string('resume',255)->nullable();
            $table->string('resume_headline',255)->nullable();
            $table->text('profile_summary')->nullable();
            $table->string('address',255)->nullable();
            $table->string('current_location',50)->nullable();
            $table->string('prefered_location',50)->nullable();
            $table->boolean('status')->default(1);
        });
        Schema::table('candidates', function (Blueprint $table) {
            $table->foreign('user_id')->references('id')->on('users');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('candidate');
    }
}
