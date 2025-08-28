<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('negosiasi', function (Blueprint $table) {
            $table->increments('id_negosiasi');
            $table->unsignedInteger('id_client');
            $table->string('sketsa')->nullable();
            $table->text('desc');
            $table->enum('type',['tipe1', 'tipe2']);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('negosiasi');
    }
};
